class UserNotifier < Postage::Mailer
  
  def invitation(user, referrer_email)
    setup_email(user)
    # postageapp_variables  :validate_email_subscriptions_url => validate_email_subscriptions_url(:validation_key => user.validation_key),
    #                       :referrer_email => referrer_email
    postageapp_template   'main-layout'
    @body[:referrer_email] = referrer_email
  end

protected

  def setup_email(user)
    recipients          user.email
    from                FROM_EMAIL
    headers             'Reply-to' => FROM_EMAIL
    @subject = case Rails.env
      when 'development': "[Development] "
      when 'staging': "[Staging] "
      else ""
    end
    @body[:user] = user
  end

end
