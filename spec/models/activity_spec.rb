# == Schema Information
#
# Table name: activities
#
#  id                 :bigint           not null, primary key
#  category           :string
#  content            :string
#  end_day            :datetime
#  image_content_type :string
#  image_file_name    :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#  slug               :string
#  start_day          :datetime
#  title              :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
# Indexes
#
#  index_activities_on_slug  (slug) UNIQUE
#
require 'rails_helper'

RSpec.describe Activity, type: :model do
  describe 'factories' do
    subject { FactoryBot.build :activity, :with_image_from_file }
    it { should be_valid }
  end

  describe 'validation' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:content) }
    it { should validate_presence_of(:category) }
    it { should validate_presence_of(:start_day) }
    it { should validate_presence_of(:end_day) }
    it { should validate_presence_of(:image) }
  end

  describe 'serializable_rich_content' do
    subject { FactoryBot.build(:activity, :with_image_from_file, content: 'Test content') }
    it { expect(subject.serializable_rich_content).to eq ActionController::Base.helpers.raw(subject.content) }
  end
end
