class BlockPolicy < WorkoutPolicy # <- Inheriting from WorkoutPolicy!!
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def new?
  #   true
    user_is_owner_of_record? || record.workout.public
  end

  def create?
    new?
  end

  def edit?
    new?
  end

  def update?
    new?
  end

  def destroy?
    new?
  end

  private

  def user_is_owner_of_record?
    user == record.workout.user || user&.admin?
  end
end
