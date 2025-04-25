class CreateExerciseCategories < ActiveRecord::Migration[7.0]
  def up
    create_table :exercise_categories do |t|
      t.references :exercise, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
    # populate join table with existing data
    Rails.logger.debug "populating books_authors"
    Exercise.find_each do |exercise|
      Rails.logger.debug { "#{exercise.name} is being added to the exercise_category table" }
      ExerciseCategory.create(exercise_id: exercise.id, category_id: exercise.category_id)
      Rails.logger.debug { "There are #{ExerciseCategory.count} exercise_category records" }
    end
    # remove obsolete column
    Rails.logger.debug "removing old association"
    remove_reference :exercises, :category, foreign_key: true
  end

  # add reference column back
  def down
    add_reference :exercises, :category, foreign_key: true # Using a model after changing its table # https://api.rubyonrails.org/classes/ActiveRecord/Migration.html#class-ActiveRecord::Migration-label-Using+a+model+after+changing+its+table
    Exercise.reset_column_information # associate exercise with category, even though it will just be one.
    ExerciseCategory.find_each do |exercise_category|
      Exercise.find(exercise_category.exercise_id).update_attribute(
        :category_id,
        exercise_category.category_id
      )
    end
    drop_table :exercise_categories
  end
end
