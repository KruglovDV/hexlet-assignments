module Web::Movies
  class ReviewsController < ApplicationController
    before_action :resource_movie

    def index
      @reviews = @movie.reviews
    end

    def new
      @review = @movie.reviews.build
    end

    def create
      @review = @movie.reviews.build(review_params)

      if @review.save
        redirect_to movie_reviews_path(@movie), notice: t('success')
      else
        render :new
      end
    end

    def edit
      @review = @movie.reviews.find(params[:id])
    end

    def update
      @review = @movie.reviews.find(params[:id])

      if @review.update(review_params)
        redirect_to movie_reviews_path(@movie), notice: t('success')
      else
        render :edit
      end
    end

    def destroy
      if @movie.reviews.destroy(params[:id])
        redirect_to movie_reviews_path(@movie), notice: t('success')
      else
        redirect_to movie_reviews_path(@movie), notice: t('fail')
      end
    end

    private

    def review_params
      params.require(:review).permit(:body)
    end
  end
end