# frozen_string_literal: true

class PostPolicy < ApplicationPolicy
  # BEGIN
  def create?
    user
  end

  def update?
    user&.id == record.author_id || user&.admin?
  end

  def destroy?
    user&.admin?
  end
  # END
end
