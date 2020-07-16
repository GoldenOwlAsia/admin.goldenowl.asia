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
#  post_type          :string
#  source             :string
#  title              :string           not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
class PostSerializer
  include FastJsonapi::ObjectSerializer
  set_type :post
  attributes  :title,
              :source,
              :post_type,
              :created_at
  attributes  :image do |post|
    post.image.url
  end
  attributes :content, &:serializable_rich_content
end
