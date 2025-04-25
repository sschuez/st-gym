# <- Inheriting from WorkoutPolicy!!
class BlockPolicy < WorkoutPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def new?
    true
  end

  def create?
    user_is_owner_of_record? || record.workout.public
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
    return false unless user

    user == record.workout.user || user.admin?
  end
end
