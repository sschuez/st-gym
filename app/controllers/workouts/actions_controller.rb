module Workouts
  class ActionsController < ApplicationController
    skip_before_action :authenticate_user!

    def show
      @workout = Workout.find(params[:workout_id])
      skip_authorization
    end
  end
end
