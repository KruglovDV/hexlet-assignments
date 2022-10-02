# frozen_string_literal: true

class User < ApplicationRecord
  # BEGIN
  has_many :tasks

  validates :name, presence: true
  # END
end
