# frozen_string_literal: true

module Posts
  class CommentsController < Posts::ApplicationController

    def create
      @post = resource_post
      @comment = @post.comments.build(post_comment_params)

      if @comment.save
        redirect_to post_path(@post)
      else
        render 'posts/show', status: :unprocessable_entity
      end
    end

    def edit
      @post = resource_post
      @comment = @post.comments.find(params[:id])
    end

    def update
      @post = resource_post
      @comment = @post.comments.find(params[:id])

      if @comment.update(post_comment_params)
        redirect_to post_path(@post)
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @post = resource_post
      @comment = @post .comments.find(params[:id])
      @comment.destroy
      redirect_to post_url(@post)
    end

    private
    
    def post_comment_params
      params.require(:post_comment).permit(:text)
    end
  end
end
