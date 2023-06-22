module ExercisesControllable 
  extend ActiveSupport::Concern

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