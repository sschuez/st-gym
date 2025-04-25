class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home about home_modal]

  def home
    @workouts = Workout.where(user_id: 1).order(created_at: :desc)
  end

  def home_modal
    skip_authorization
  end

  def about; end
end
