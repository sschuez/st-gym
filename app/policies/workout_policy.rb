class WorkoutPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      if user.admin
        scope.all
      else
        scope.where(user: user).or(scope.where(public: true))
      end
    end
  end

  def new?
    true
  end

  def show?
    new?
  end

  def create?
    user_is_owner_of_record? || record.public
  end

  def edit?
    create?  
  end

  def update?
    create?
  end

  def toggle_public?
    destroy?
  end

  def user_workouts?
    user == User.find(params[:user]) || user.admin?
  end
  
  def destroy?
    user_is_owner_of_record?
  end

  private
  
  def user_is_owner_of_record?
    user == record.user || user.admin?
  end
end
