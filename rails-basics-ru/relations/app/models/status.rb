# frozen_string_literal: true

class Status < ApplicationRecord
  # BEGIN
  has_many :tasks, dependent: :destroy

  validates :name, presence: true
  # END
end
