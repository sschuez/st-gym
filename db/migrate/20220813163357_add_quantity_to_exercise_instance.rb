class AddQuantityToExerciseInstance < ActiveRecord::Migration[7.0]
  def change
    add_column :exercise_instances, :quantity, :string
  end
end
