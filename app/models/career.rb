# == Schema Information
#
# Table name: careers
#
#  id                 :bigint           not null, primary key
#  image_content_type :string
#  image_file_name    :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#  job_type           :string
#  status             :string
#  title              :string           not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
class Career < ApplicationRecord
  has_many :job_submisstion
  has_rich_text :content
  has_attached_file :image, storage: :cloudinary,
                            path: ':id/:style/:filename',
                            styles: { medium: '300x300>', thumb: '100x100>' },
                            default_url: '/images/:style/missing.png'
  validates_attachment_content_type :image,
                                    content_type: ['image/jpeg', 'image/gif', 'image/png']
  validates :content, presence: true
  validates :title, presence: true

  def serializable_rich_content
    ActionController::Base.helpers.sanitize(ActionController::Base.helpers.raw(content))
  end
end
