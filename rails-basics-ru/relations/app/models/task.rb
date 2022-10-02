class Task < ApplicationRecord
  belongs_to :user
  belongs_to :status

  validates :name, :description, presence: true
end
