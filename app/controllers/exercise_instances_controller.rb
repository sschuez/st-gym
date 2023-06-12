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

    @exercises = determine_category_exercises(params)
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
  end
  
  private
  
  def determine_category_exercises(params)
    main_category_query = params[:main_category].present? && (params[:main_category].to_i != 0 || params[:main_category] != "reset_main_category_list")
    category_query = params[:category].present? && (params[:category].to_i != 0 || params[:category] != "reset_category_list")
    
    if main_category_query && category_query
      main_category_exercises = Exercise.joins(:exercise_categories).where(exercise_categories: { category_id: params[:main_category].to_i }).ordered
      category_exercises = Exercise.joins(:exercise_categories).where(exercise_categories: { category_id: params[:category].to_i }).ordered
      exercises_array = main_category_exercises & category_exercises
      return exercises = Exercise.where(id: exercises_array.map(&:id))
    elsif main_category_query && !category_query
      return exercises = Exercise.joins(:exercise_categories).where(exercise_categories: { category_id: params[:main_category].to_i }).ordered
    elsif params[:main_category] == "reset_main_category_list" && category_query
      return exercises = Exercise.joins(:exercise_categories).where(exercise_categories: { category_id: params[:category].to_i }).ordered  
    else
      return exercises = Exercise.ordered
    end
  end


  def query_and_respond(exercises)
    if params[:query].present? && params[:query].to_i == 0
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
