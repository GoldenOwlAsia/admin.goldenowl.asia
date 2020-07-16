module Api
  module V1
    class PostsController < ApplicationController
      def index
        @posts = if request_params.blank?
                   Post.all
                 else
                   Post.order(created_at: :asc).first(5)
                 end

        render json: PostSerializer.new(@posts)
      end

      def show
        @post = Post.find(params[:id])
        render json: PostSerializer.new(@post)
      end

      private

      def request_params
        params[:latest_posts]
      end
    end
  end
end
