class UserNotifier < Postage::Mailer
  
  def user_registered(user)
    recipients       ADMIN_EMAILS
    postage_template 'main-layout'
    setup_subject    "#{user.name} has registered on the website"
    body             :user => user
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
