class SubscriptionMailer < ApplicationMailer
  default from: 'austin@goldenowl.asia'

  def subscription_email_for_post(email)
    mail(to: email, subject: 'Subscription Email') do |format|
      format.html {
        render locals: { url: post_url(Post.last) }
      }
    end
  end

  def subscription_email_for_career(email)
    mail(to: email, subject: 'Subscription Email') do |format|
      format.html {
        render locals: { url: career_url(Career.last) }
      }
    end
  end
end
