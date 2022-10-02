# frozen_string_literal: true

require 'application_system_test_case'

# BEGIN
class PostsTest < ApplicationSystemTestCase
  test 'visiting the index' do
    visit posts_path
    assert_selector 'h1', text: 'Posts'
  end

  test 'visiting post' do
    one_post = posts(:one)
    visit post_path(one_post)
    assert_text one_post.title
    assert_text one_post.body
  end

  test 'creating a post' do
    title = 'test post title'
    body = 'test post body'
    visit posts_path
    click_on 'New Post'
    fill_in 'Title', with: title
    fill_in 'Body', with: body
    click_on 'Create Post'
    assert_text 'Post was successfully created.'
    assert_text title
    assert_text body
  end

  test 'updating a post' do
    updated_title = 'Updated title'
    visit posts_path
    click_on 'Edit', match: :first
    fill_in 'Title', with: updated_title
    click_on 'Update Post'
    assert_text 'Post was successfully updated.'
    assert_text updated_title
  end

  test 'destorying a post' do
    visit posts_path
    first_post = posts(:one)
    assert_text first_post.title, count: 1
    page.accept_confirm do
      find_link(text: 'Destroy', href: post_path(first_post)).click
    end
    assert_text 'Post was successfully destroyed.'
    assert_text first_post.title, count: 0
  end

  test 'creates a comment' do
    comment_content = 'test comment'
    visit posts_path
    click_on 'Show', match: :first
    click_on 'Create Comment'
    fill_in 'post_comment_body', with: comment_content
    click_on 'Create Comment'
    assert_text 'Comment was successfully created.'
    assert_text comment_content
  end
end
# END
