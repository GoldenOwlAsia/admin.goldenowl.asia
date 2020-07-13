class SubscriptionMailer < ApplicationMailer
  default from: 'austin@goldenowl.asia'

  def subscription_email_for_posts(email)
    mail(to: email, subject: 'Subscription Email')
  end

  def subscription_email_for_post(email)
    mail(to: email, subject: 'Subscription Email')
  end
end
