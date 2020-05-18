# frozen_string_literal: true

# == Schema Information
#
# Table name: posts
#
#  id                 :bigint           not null, primary key
#  image_content_type :string
#  image_file_name    :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#  title              :string           not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
# require 'spec_helper'

FactoryBot.define do
  factory :post do
    title { 'MyString' }
    content { 'MyText' }
    image { File.new("#{Rails.root}/spec/support/fixtures/tests.jpg") }
  end
  trait :invalid do
    title { '' }
    content { '' }
    image { '' }
  end
end
