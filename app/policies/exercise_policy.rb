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
    user&.admin?
  end

  def update?
    edit?
  end
end
