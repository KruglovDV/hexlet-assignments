# frozen_string_literal: true

require 'test_helper'

class Posts::CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @comment = post_comments(:one)
    @post = @comment.post
    @comment_params = {
      body: Faker::Lorem.sentence
    }
  end

  test 'should create comment' do
    params = { post_comment: @comment_params }
    post post_comments_url(@post, locale: :en), params: params

    comment = Post::Comment.find_by! @comment_params

    assert_redirected_to post_url(@post)
    assert { comment }
  end

  test 'should show edit' do
    get edit_post_comment_url(@comment.post, @comment, locale: :en)

    assert_response :success
  end

  test 'should show update comment' do
    params = { post_comment: @comment_params }
    patch post_comment_url(@comment.post, @comment, locale: :en), params: params

    assert_response :redirect
    assert { Post::Comment.find_by! @comment_params }
  end

  test 'should destroy comment' do
    delete post_comment_url(@post, @comment, locale: :en)

    assert_redirected_to post_url(@post)
    assert { !Post::Comment.exists? @comment.id }
  end
end
