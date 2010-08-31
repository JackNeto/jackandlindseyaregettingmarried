class CmsPostNotifier < Postage::Mailer
  
  def comment_posted(comment)
    recipients       ADMIN_EMAILS
    postage_template 'main-layout'
    setup_subject    "#{comment.name} posted a comment in reply to '#{comment.cms_post.title}'"
    body             :comment => comment
  end

  def new_post(post)
    recipients       User.all.collect(&:email)
    postage_template 'main-layout'
    setup_subject    "A new entry has been posted on Jack & Lindsey's website"
    body             :post => post
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
