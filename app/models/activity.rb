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
class Activity < ApplicationRecord
  extend FriendlyId
  include SupportModel

  friendly_id :title, use: :slugged
  validates :title, presence: true

  has_rich_text :content
  validates :content, presence: true

  validates :category,
            presence: true

  validates :start_day, presence: true
  validates :end_day, presence: true

  has_attached_file :image, styles: { medium: '300x300>', thumb: '100x100>' }
  validates_attachment_presence :image
  validates_attachment_content_type :image,
                                    presence: true,
                                    content_type: %w[image/jpeg image/gif image/png]

  scope :search, ->(search_string) { where('lower(title) LIKE ?', "%#{search_string.downcase}%") }
end
