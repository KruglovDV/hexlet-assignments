# frozen_string_literal: true

class Resume < ApplicationRecord
  validates :name, presence: true
  validates :contact, presence: true

  # BEGIN
  has_many :educations, class_name: :ResumeEducation, dependent: :destroy
  has_many :works, class_name: :ResumeWork, dependent: :destroy

  accepts_nested_attributes_for :educations, :works, allow_destroy: true, reject_if: :all_blank
  # END
end
