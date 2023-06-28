class PostPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      if user&.admin?
        scope.all
      else
        scope.published
      end
    end
  end

  def index?
    true
  end

  def new?
    user&.admin?
  end

  def show?
    record.published? || user&.admin?
  end

  def create?
    new?
  end

  def update?
    create?
  end

  def destroy?
    create?
  end
end
