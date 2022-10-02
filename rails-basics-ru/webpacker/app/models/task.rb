# frozen_string_literal: true

class Task < ApplicationRecord
  validates :name, presence: true

  belongs_to :assigned_to, class_name: 'User', foreign_key: 'user_id'
end
