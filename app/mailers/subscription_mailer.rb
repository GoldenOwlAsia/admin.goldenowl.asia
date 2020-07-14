class SubscriptionMailer < ApplicationMailer
  default from: 'austin@goldenowl.asia'

  def subscription_email_for_post(email, post_id = nil)
    @post = Post.find_by(id: post_id)
    return if email.nil? || @post.nil?

    mail(to: email, subject: 'Subscription Email')
  end

  def subscription_email_for_career(email, career_id = nil)
    @career = Career.find_by(id: career_id)
    return if email.nil? || @career.nil?

    mail(to: email, subject: 'Subscription Email')
  end
end
