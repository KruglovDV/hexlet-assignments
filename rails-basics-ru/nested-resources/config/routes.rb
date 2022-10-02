# frozen_string_literal: true

Rails.application.routes.draw do
  root 'homes#index'

  # BEGIN
  resources :posts do
    scope module: :posts, as: 'post' do
      resources :comments, only: [:create, :edit, :update, :destroy]
    end
  end
  # END
end
