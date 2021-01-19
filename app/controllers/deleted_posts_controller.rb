class DeletedPostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_deleted_post, only: %i[show restore]

  def index
    @pagy, @deleted_posts = pagy(Post.deleted, items: per_page)
  end

  def show; end

  def restore
    PostCategory.only_deleted.find(@deleted_post.post_category_id).restore unless @deleted_post.post_category
    @deleted_post.update!(deleted: false)

    redirect_to deleted_posts_path, success: 'Blog was successfully restored.'
  end

  private

  def set_deleted_post
    @deleted_post = Post.deleted.friendly.find(params[:id])
  end
end
