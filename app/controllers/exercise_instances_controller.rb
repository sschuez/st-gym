class ExerciseInstancesController < ApplicationController
  include ExercisesQueryable
  skip_before_action :authenticate_user!#, only: [ :new, :show ]
  before_action :set_workout, only: [ :new, :create ]
  before_action :set_block, only: [ :new, :create ]

  def new
    @exercise_instance = @block.exercise_instances.new
    authorize @exercise_instance

    return_main_and_user_categories_as_instance_variables(params)
    user_exercises = determine_if_user_category_filter_present(params)
    @exercises = determine_category_exercises(user_exercises, params)

    query_and_respond(@exercises)
  end
  
  def create
    exercises = params[:exercise_instance][:exercise_id]
    @exercise_instances = exercises.reject { |e| e.empty? }
    .map do |exercise|      
      @exercise_instance = @block.exercise_instances.create(
        exercise: Exercise.find(exercise.to_i)
      )
      authorize @exercise_instance
    end
    
    respond_to { |format| format.turbo_stream }
  end

  def destroy
    @exercise_instance = ExerciseInstance.find(params[:id])
    authorize @exercise_instance
    
    @exercise_instance.destroy
    
    respond_to { |format| format.turbo_stream }
  end

  def set_workout
    @workout = Workout.find(params[:workout_id])
  end

  def set_block
    @block = Block.find(params[:block_id])
  end

  def exercise_instance_params
    params.require(:exercise_instance).permit(:exercise_id[], :repetitions, :time, :tabata, :block_id, :workout_id)
  end
end
