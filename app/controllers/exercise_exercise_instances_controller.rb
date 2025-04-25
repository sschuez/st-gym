class ExerciseExerciseInstancesController < ApplicationController
  include ExercisesControllable

  def new
    @exercise = Exercise.new
    authorize @exercise

    @block = Block.find(params[:block_id])
    @url = workout_block_exercise_exercise_instances_path(@block.workout, @block)
  end

  def create
    @exercise = Exercise.new(exercise_params)
    authorize @exercise

    @exercise.user = current_user
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
end
