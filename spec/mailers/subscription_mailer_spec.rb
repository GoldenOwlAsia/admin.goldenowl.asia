require 'rails_helper'

RSpec.describe SubscriptionMailer, type: :mailer do
  describe '.subscription_email_for_post' do
    before do
      @post = FactoryBot.create(:post, :with_image_from_file)
      @reveiver_email = 'to_reveiver@gmail.com'
      @mail = SubscriptionMailer.subscription_email_for_post('to_reveiver@gmail.com', @post.id)
    end

    it 'renders the headers' do
      expect(@mail.subject).to eq('Subscription Email')
      expect(@mail.to).to eq([@reveiver_email])
      expect(@mail.from).to eq(['austin@goldenowl.asia'])
    end

    it 'renders the body' do
      expect(@mail.body.encoded).to include('GOLDEN OWL - NEW BLOG')
      expect(@mail.body.encoded).to include(post_url(@post))
    end
  end

  describe '.subscription_email_for_carrer' do
    before do
      @carrer = FactoryBot.create(:carrer, :with_image_from_file)
      @reveiver_email = 'to_reveiver@gmail.com'
      @mail = SubscriptionMailer.subscription_email_for_post('to_reveiver@gmail.com', @post.id)
    end

    it 'renders the headers' do
      expect(@mail.subject).to eq('Subscription Email')
      expect(@mail.to).to eq([@reveiver_email])
      expect(@mail.from).to eq(['austin@goldenowl.asia'])
    end

    it 'renders the body' do
      expect(@mail.body.encoded).to include('GOLDEN OWL - NEW BLOG')
      expect(@mail.body.encoded).to include(post_url(@post))
    end
  end
end
