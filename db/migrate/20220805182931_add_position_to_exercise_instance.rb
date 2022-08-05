class AddPositionToExerciseInstance < ActiveRecord::Migration[7.0]
  def change
    add_column :exercise_instances, :position, :integer
  end
end
