class SubscriptionMailer < ApplicationMailer
  default from: 'austin@goldenowl.asia'

  def subscription_email_for_post(email)
    lastest_post_url = post_url(Post.last)
    mail(to: email, subject: 'Subscription Email') do |format|
      format.html {
        render locals: { url: lastest_post_url }
      }
    end
  end

  def subscription_email_for_career(email)
    lastest_carrer_url = career_url(Career.last)
    mail(to: email, subject: 'Subscription Email') do |format|
      format.html {
        render locals: { url: lastest_carrer_url }
      }
    end
  end
end
