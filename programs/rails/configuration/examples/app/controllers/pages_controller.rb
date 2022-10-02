class PagesController < ApplicationController
  def index
    # Вызов метода логирования
    logger.debug('Debug logs')
  end
end
