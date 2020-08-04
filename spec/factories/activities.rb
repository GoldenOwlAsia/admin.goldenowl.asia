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
FactoryBot.define do
  factory :activity do
    title { Faker::Name.name }
    content { Faker::Name.name }
    category { Faker::Name.name }
    start_day { Faker::Time.between(from: 2.days.ago, to: Time.now) }
    end_day { Faker::Time.between(from: 1.days.ago, to: Time.now) }
  end

  trait :invalid_activity do
    title { '' }
    content { '' }
    category { '' }
    start_day { '' }
    end_day { '' }
    slug { '' }
  end
end
