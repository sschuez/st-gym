class ExercisePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.order(name: :asc)
    end
  end

  def new?
    true
  end

  def show?
    new?
  end

  def create?
    new?
  end
end
