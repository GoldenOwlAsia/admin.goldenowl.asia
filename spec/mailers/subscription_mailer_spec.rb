require 'rails_helper'

RSpec.describe SubscriptionMailer, type: :mailer do
  describe '.subscription_email_for_post' do
      let!(:post) { FactoryBot.create(:post, :with_image_from_file) }
      let!(:reveiver_email) { 'to_reveiver@gmail.com' }
      let!(:mail) { 
        SubscriptionMailer.subscription_email_for_post(
          'to_reveiver@gmail.com', post.id
        )
      }

    it 'renders the headers' do
      expect(mail.subject).to eq('Subscription Email')
      expect(mail.to).to eq([reveiver_email])
      expect(mail.from).to eq([ENV['MAIL_ADMIN_SENDER']])
    end

    it 'renders the body' do
      expect(mail.body.encoded).to include('GOLDEN OWL - NEW BLOG')
      expect(mail.body.encoded).to include(post.slug)
    end
  end

  describe '.subscription_email_for_carrer' do
    let!(:career) { FactoryBot.create(:career) }
    let!(:reveiver_email) { 'to_reveiver@gmail.com' }
    let!(:mail) { 
      SubscriptionMailer.subscription_email_for_career(
        'to_reveiver@gmail.com', career.id
      )
    }

    it 'renders the headers' do
      expect(mail.subject).to eq('Subscription Email')
      expect(mail.to).to eq([reveiver_email])
      expect(mail.from).to eq([ENV['MAIL_ADMIN_SENDER']])
    end

    it 'renders the body' do
      expect(mail.body.encoded).to include('GOLDEN OWL - NEW CAREER')
      expect(mail.body.encoded).to include('https://goldenowl.asia/careers')
    end
  end
end
