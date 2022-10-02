# frozen_string_literal: true

Rails.application.routes.draw do
  # BEGIN
  root 'home#index'
  scope ('/:locale'), locale: /en|ru/ do
    resources :posts do
      scope module: :posts, only: %i[edit create update destroy] do
        resources :comments
      end
    end
  end
  # END

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
