class ActivitySerializer
  include FastJsonapi::ObjectSerializer

  attributes  :title,
              :content,
              :category,
              :start_day,
              :end_day,
              :created_at,
              :updated_at,
              :slug

  attributes :image, &:image_url
  attributes :content, &:serializable_rich_content
end
