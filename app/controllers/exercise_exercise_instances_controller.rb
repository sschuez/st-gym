class ExerciseExerciseInstancesController < ApplicationController
  skip_after_action :verify_authorized, only: [:new, :create]

  def new
    @exercise = Exercise.new
    @block = Block.find(params[:block_id])
    @url = workout_block_exercise_exercise_instances_path(@block.workout, @block)
  end

  def create
    @exercise = Exercise.new(exercise_params)
    authorize @exercise

    @workout = Workout.find(params[:workout_id])
    @block = Block.find(params[:block_id])
    
    exercise_categories = get_exercise_categories(params)
    has_one_main_category = check_if_has_at_least_one_main_category(exercise_categories, @exercise)
    
    if has_one_main_category
      if @exercise.save
        exercise_categories.each { |exercise_category| exercise_category.update(exercise: @exercise) }
        @exercise_instance = ExerciseInstance.create(block: @block, exercise: @exercise)
        respond_to do |format| 
          format.turbo_stream { flash.now[:notice] = "Exercise created and added to block" }
        end
      else
        render :new, status: :unprocessable_entity
      end
    else
      add_custom_error(@exercise)
      render :new, status: :unprocessable_entity
    end
  end

  private

  def exercise_params
    params.require(:exercise).permit(:name, :description, files: [])
  end

  def get_exercise_categories(params)
    exercise = Exercise.find(params[:id]) if params[:id]
    categoriesArray = JSON.parse(params[:exercise][:exercise_categories])
    categories = Category.where(id: categoriesArray)
        
    exercise_categories = categories
      .reject { |category| category.selected_in?(exercise)}
      .map { |category| ExerciseCategory.new(category: category) }
  end
  
  def check_if_has_at_least_one_main_category(exercise_categories, exercise)
    new_exercise_categories = exercise_categories.select { |exercise_category| exercise_category.category.main_category }.count
    existing_exercise_categories = exercise.exercise_categories.select { |exercise_category| exercise_category.category.main_category }.count
  
    new_exercise_categories + existing_exercise_categories >= 1
  end

  def add_custom_error(exercise)
    exercise.errors.add(:categories, "must have at least one main category")
  end
end