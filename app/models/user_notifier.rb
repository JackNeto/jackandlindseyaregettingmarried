class UserNotifier < Postage::Mailer
  
  def user_registered(user)
    recipients       ADMIN_EMAILS
    postage_template 'main-layout'
    setup_subject    "#{user.name} has registered on the website"
    body             :user => user
  end
  
  def user_rsvp(user)
    recipients       ADMIN_EMAILS
    postage_template 'main-layout'
    setup_subject    "#{user.name} has RSVP'ed"
    body             :user => user
  end

  def new_message(users, subject, content)
    recipients_hash = {}
    users.each do |user|
      [subject, content].join(' ').gsub(/\{\{([^}]*)\}\}/) do
        recipients_hash[user.email] ||= {}
        recipients_hash[user.email][$1] = user.send($1)
      end
    end
    recipients       recipients_hash.blank? ? users.collect(&:email) : recipients_hash
    postage_template 'main-layout'
    setup_subject    subject
    part "text/html" do |p|
      p.body content
      p.transfer_encoding "base64"
    end
    
  end

protected

  def setup_subject(subject)
    @subject = case Rails.env
      when 'development': "[Development] "
      when 'staging': "[Staging] "
      else ""
    end
    @subject += subject
  end


end
