class ExerciseCategoriesController < ApplicationController
  skip_after_action :verify_authorized, only: :destroy

  def destroy
    exercise = Exercise.find(params[:exercise_id])
    category = Category.find(params[:category_id])
    exercise_category = ExerciseCategory.find_by(exercise: exercise, category: category)
    
    exercise_category.destroy
    head :ok
  end
end