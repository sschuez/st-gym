class CreateExerciseCategories < ActiveRecord::Migration[7.0]
  def up
    create_table :exercise_categories do |t|
      t.references :exercise, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
    # populate join table with existing data
    puts "populating books_authors"
    Exercise.all.each do |exercise|
      puts "#{exercise.name} is being added to the exercise_category table"
      ExerciseCategory.create(exercise_id: exercise.id, category_id: exercise.category_id)
      puts "There are #{ExerciseCategory.count} exercise_category records"
    end
    # remove obsolete column
    puts "removing old association"
    remove_reference :exercises, :category, foreign_key: true
  end
  
  def down # add reference column back
    add_reference :exercises, :category, foreign_key: true # Using a model after changing its table # https://api.rubyonrails.org/classes/ActiveRecord/Migration.html#class-ActiveRecord::Migration-label-Using+a+model+after+changing+its+table
    Exercise.reset_column_information # associate exercise with category, even though it will just be one.
    ExerciseCategory.all.each do |exercise_category|
      Exercise.find(exercise_category.exercise_id).update_attribute(
        :category_id,
        exercise_category.category_id,
      )
    end # remove join table
    drop_table :exercise_categories
  end
end
