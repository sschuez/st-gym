class ContactPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all if user&.admin?
    end
  end

  def new?
    true
  end

  def create?
    new?
  end

  def show?
    user&.admin?
  end

  def destroy?
    user&.admin?
  end
end
