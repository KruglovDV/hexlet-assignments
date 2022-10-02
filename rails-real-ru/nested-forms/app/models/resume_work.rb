# frozen_string_literal: true

class ResumeWork < ApplicationRecord
  validates :company, presence: true
  validates :begin_date, presence: true

  # BEGIN
  belongs_to :resume
  # END
end
