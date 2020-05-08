# == Schema Information
#
# Table name: careers
#
#  id                 :bigint           not null, primary key
#  image_content_type :string
#  image_file_name    :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#  jobtype            :string           not null
#  status             :string           not null
#  title              :string           not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
class Career < ApplicationRecord
  has_many :career_form
  has_rich_text :content
  has_attached_file :image,
                    styles: { medium: '300x300>', thumb: '100x100>' },
                    default_url: '/images/:style/missing.png'
  validates_attachment_content_type :image,
                                    content_type: ['image/jpeg', 'image/gif', 'image/png']
  validates :content, presence: true
  validates :title, presence: true
  validates :jobtype, presence: true
  validates :status, presence: true
end
