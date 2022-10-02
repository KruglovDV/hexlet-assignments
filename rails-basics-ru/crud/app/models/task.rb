class Task < ApplicationRecord
  validates :name, :status, :creator, presence: true
  validates_inclusion_of :completed, in: [true, false]
end
