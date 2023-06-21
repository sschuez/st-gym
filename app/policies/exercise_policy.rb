class ExercisePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.order(name: :asc)
    end
  end

  def show?
    new?
  end
 
  def new?
    true
  end
  
  def create?
    new?
  end

  def edit?
    admin_or_owner?
  end

  def update?
    edit?
  end

  def destroy?
    admin_or_owner?
  end

  private

  def admin_or_owner?
    user&.admin? || record.user == user
  end
end
