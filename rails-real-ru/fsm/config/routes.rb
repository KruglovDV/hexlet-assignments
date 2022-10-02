# frozen_string_literal: true

Rails.application.routes.draw do
  resources :vacancies do
    # BEGIN
    member do
      patch 'publish'
      patch 'archive'
    end
    # END
  end

  root 'vacancies#index'
end
