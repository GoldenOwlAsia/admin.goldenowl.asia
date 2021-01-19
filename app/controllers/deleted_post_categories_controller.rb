class DeletedPostCategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_deleted_post_category, only: %i[show restore]

  def index
    @pagy, @deleted_post_categories = pagy(PostCategory.only_deleted, items: per_page)
  end

  def show; end

  def restore
    @deleted_post_category.restore

    redirect_to deleted_post_categories_path, success: 'Blog Category was successfully restored.'
  end

  private

  def set_deleted_post_category
    @deleted_post_category = PostCategory.only_deleted.friendly.find(params[:id])
  end
end
