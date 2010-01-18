class CmsCommentNotifier < Postage::Mailer
  
  def comment_posted(comment)
    recipients       ADMIN_EMAILS
    postage_template 'main-layout'
    setup_subject    "#{comment.name} posted a comment in reply to '#{comment.cms_post.title}'"
    body             :comment => comment
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
