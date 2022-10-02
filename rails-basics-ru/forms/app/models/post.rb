class Post < ApplicationRecord
  validates :title, :body, :summary, presence: true
  validates :published, inclusion: { in: [true, false] }
end
