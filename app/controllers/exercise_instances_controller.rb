class ExerciseInstancesController < ApplicationController
  skip_before_action :authenticate_user!#, only: [ :new, :show ]
  before_action :set_workout, only: [ :new, :create ]
  before_action :set_block, only: [ :show, :new, :create ]

  def show
    @exercise_instance = @block.exercise_instances.find(params[:id])
    authorize @exercise_instance
    @exercise = @exercise_instance.exercise
  end
  
  def new
    @exercise_instance = @block.exercise_instances.new
    authorize @exercise_instance
    
    @exercises = Exercise.order(name: :asc)
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

    respond_to do |format|
      format.turbo_stream
    end

    # head :ok
  end

  private

  def query_and_respond(exercises)
    if params[:query].present?
      # sql_query = "name ILIKE :query OR description ILIKE :query"
      sql_query = "name ILIKE :query"
      exercises = exercises.where(sql_query, query: "%#{params[:query]}%")
    end
  
    respond_to do |format|
      format.html
      format.text { render partial: "list", locals: { exercises: exercises }, formats: :html }
      format.turbo_stream
    end
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
