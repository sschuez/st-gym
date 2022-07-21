class ExerciseInstancesController < ApplicationController
  skip_before_action :authenticate_user!#, only: [ :new, :show ]
  before_action :set_session

  def new
    # debugger
    @exercise_instance = ExerciseInstance.new
    @exercises = Exercise.all

  end
  
  def create
    # @exercise_instance = ExerciseInstance.create(
      # session: @session,
      # :exercisable => 
    # )
  end

  private

  def set_session
    @session = Session.find(params[:session_id])
  end
end
