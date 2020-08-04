module SupportModel
  extend ActiveSupport::Concern

  def image_url(*args)
    url = image.url(*args)
    return url unless image.options[:storage] == :cloudinary

    url&.gsub(%r{/v\d+\//}, '')
  end

  def serializable_rich_content
    ActionController::Base.helpers.sanitize(
      ActionController::Base.helpers.raw(content)
    )
  end
end
