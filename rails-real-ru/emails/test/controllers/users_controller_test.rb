# frozen_string_literal: true

require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    password = Faker::Internet.password

    @attrs = {
      name: Faker::Movies::BackToTheFuture.character,
      email: Faker::Internet.email,
      password: password,
      password_confirmation: password
    }
  end

  test 'new' do
    get new_user_url
    assert_response :success
  end

  test 'create' do
    post users_url, params: { user: @attrs }

    assert_response :redirect

    user = User.find_by! email: @attrs[:email]

    assert { user.waiting_confirmation? }
  end

  test 'show' do
    user = sign_in_as :one

    get user_url(user)
    assert_response :success
  end

  test 'confirm' do
    user = users :waiting_confirmation

    get confirm_user_url(confirmation_token: user.confirmation_token)
    assert_response :redirect

    user.reload

    assert { user.active? }
  end
end
