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
    exercises.reject { |e| e.empty? }.each do |exercise|
      @exercise_instance = @block.exercise_instances.new(
        exercise: Exercise.find(exercise.to_i)
      )
      authorize @exercise_instance
      respond_to do |format|
        if @exercise_instance.save
          format.turbo_stream { flash.now[:notice] = "Exercise instance was successfully created." }
          # format.html { redirect_to @workout, notice: "Exercise instance was successfully created." }
          # format.json { render :show, status: :created, location: @exercise_instance }
        else
          format.turbo_stream do
            render turbo_stream: turbo_stream.update(
              'new_exercise_instance',
              partial: "exercise_instances/form_modal",
              locals: {exercise_instance: @exercise_instance})
          end
          # format.html { render :new, status: :unprocessable_entity }
          # format.json { render json: @exercise_instance.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  def destroy
    @exercise_instance = ExerciseInstance.find(params[:id])
    authorize @exercise_instance
    @exercise_instance.destroy
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
