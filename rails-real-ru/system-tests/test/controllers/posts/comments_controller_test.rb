# frozen_string_literal: true

require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @comment = post_comments(:one)
    @post = @comment.post

    @attrs = {
      body: Faker::Books::Dune.quote
    }
  end

  test 'should create comment' do
    post post_comments_url(@post), params: { post_comment: @attrs }

    comment = @post.comments.find_by body: @attrs[:body]

    assert { comment }
    assert_redirected_to post_url(@post)
  end

  test 'should destroy comment' do
    delete post_comment_url(@post, @comment)

    assert { !Post::Comment.exists? @comment.id }

    assert_redirected_to post_url(@post)
  end
end
