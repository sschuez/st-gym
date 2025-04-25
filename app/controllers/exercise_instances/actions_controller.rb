module ExerciseInstances
  class ActionsController < ApplicationController
    skip_before_action :authenticate_user!

    def edit_exercise_instance
      @workout = Workout.find(params[:workout_id])
      @exercise_instance = ExerciseInstance.find(params[:exercise_instance_id])
      skip_authorization
    end
  end
end
