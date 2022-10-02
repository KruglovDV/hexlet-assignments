# frozen_string_literal: true

3.times.each do |post_index|
  post = Post.create(title: "Post ##{post_index}", body: "Post body #{post_index}")
  3.times.each do |comment_index|
    post.post_comments.create(text: "comment #{comment_index}")
  end
end