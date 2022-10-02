# frozen_string_literal: true

class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true

  has_many :tasks, dependent: :destroy
end
