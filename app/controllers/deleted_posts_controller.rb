class DeletedPostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_deleted_post, only: %i[show restore]

  def index
    @pagy, @deleted_posts = pagy(Post.only_deleted, items: per_page)
  end

  def show; end

  def restore
    @deleted_post.restore

    redirect_to deleted_posts_path, success: 'Blog was successfully restored.'
  end

  private

  def set_deleted_post
    @deleted_post = Post.only_deleted.friendly.find(params[:id])
  end
end
