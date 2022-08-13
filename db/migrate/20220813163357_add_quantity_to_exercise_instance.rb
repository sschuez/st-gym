class AddQuantityToExerciseInstance < ActiveRecord::Migration[7.0]
  def change
    add_column :exercise_instances, :tabata, :boolean, default: false
  end
end
