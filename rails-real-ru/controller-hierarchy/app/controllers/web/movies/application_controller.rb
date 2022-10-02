# frozen_string_literal: true

class Web::Movies::ApplicationController < Web::ApplicationController
  helper_method :resource_movie

  def resource_movie
    # BEGIN
    @movie ||= Movie.find(params[:movie_id])
    # END
  end
end
