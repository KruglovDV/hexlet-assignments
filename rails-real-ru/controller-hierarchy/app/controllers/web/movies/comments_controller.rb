module Web::Movies
  class CommentsController < ApplicationController
    before_action :resource_movie

    def index
      @comments = @movie.comments
    end

    def new
      @comment = @movie.comments.build
    end

    def create
      @comment = @movie.comments.build(comment_params)
      if @comment.save
        redirect_to @movie, notice: t('success')
      else
        render :new
      end
    end

    def edit
      @comment = @movie.comments.find(params[:id])
    end

    def update
      @comment = @movie.comments.find(params[:id])

      if @comment.update(comment_params)
        redirect_to movie_comments_path(@movie), notice: t('success')
      else
        render :edit
      end
    end

    def destroy
      if @movie.comments.destroy(params[:id])
        redirect_to movie_comments_path(@movie), notice: t('success')
      else
        redirect_to movie_comments_path(@movie), notice: t('fail')
      end
    end

    private

    def comment_params
      params.require(:comment).permit(:body)
    end
  end
end