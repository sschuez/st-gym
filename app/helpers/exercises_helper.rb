module ExercisesHelper
  def main_categories_that_have_exercises(exercises)
    Category.of_exercises(exercises.map(&:id)).main_categories_with_exercises
  end

  def other_categories_that_have_exercises(exercises)
    Category.of_exercises(exercises.map(&:id)).other_categories_with_exercises
  end

  def main_category_exercises_count(user_category_id, category_id)
    if user_category_id && user_category_id != "reset_user_category_list"
      Exercise.by_user(current_user.id).by_main_category(category_id).count
    else
      Category.find(category_id).exercises.count
    end
  end

  def other_category_exercises_count(user_category_id, main_category_id, category_id)
    if user_category_id && main_category_id && user_category_id != "reset_user_category_list" && main_category_id != "reset_main_category_list"
      Exercise.by_user(current_user.id).by_main_and_other_category(main_category_id, category_id).count
    else
      Category.find(category_id).exercises.count
    end
  end
    
end
