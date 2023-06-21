class ExercisesController < ApplicationController
  include ExercisesControllable
  before_action :set_exercise, only: %i[ show edit update destroy ]

  def index
    @exercises = policy_scope(Exercise).includes(:categories).ordered
  end

  def show
  end

  def new
    @exercise = Exercise.new
    authorize @exercise
    
    @url = exercises_path
  end

  def edit
  end

  def create
    @exercise = Exercise.new(exercise_params)
    authorize @exercise

    @exercise.user = current_user
    exercise_categories = get_exercise_categories(params)
    has_one_main_category = check_if_has_at_least_one_main_category(exercise_categories, @exercise)

    if has_one_main_category
      if @exercise.save
        redirect_to request.referrer, notice: "#{@exercise.name} was created. You can now choose and add it to a block."
        exercise_categories.each { |exercise_category| exercise_category.update(exercise: @exercise) }
      else
        render :new, status: :unprocessable_entity
      end
    else
      add_custom_error(@exercise)
      render :new, status: :unprocessable_entity
    end
  end

  def update
    new_exercise_categories = get_exercise_categories(params)
    has_one_main_category = check_if_has_at_least_one_main_category(new_exercise_categories, @exercise)

    if has_one_main_category
      if @exercise.update(exercise_params)
        new_exercise_categories.each { |new_exercise_category| new_exercise_category.update(exercise: @exercise) }
        redirect_to request.referrer, notice: "Exercise was successfully updated."
      else
        render :edit, status: :unprocessable_entity
      end
    else
      add_custom_error(@exercise)
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @exercise.destroy

    respond_to do |format|
      format.html { redirect_to exercises_url, notice: "Exercise was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  
  def set_exercise
    @exercise = Exercise.find(params[:id])
    authorize @exercise
  end
end
