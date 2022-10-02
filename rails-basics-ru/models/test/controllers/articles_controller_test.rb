# frozen_string_literal: true

require 'test_helper'

class ArticlesTest < ActionDispatch::IntegrationTest
  setup do
    @article = articles(:one)
  end

  test 'should get index' do
    get articles_url

    assert_response :success
    assert_match 'Articles', @response.body
  end

  test 'should show article' do
    get article_url @article

    assert_response :success
    assert_match @article.title, @response.body
    assert_match @article.body, @response.body
  end
end
