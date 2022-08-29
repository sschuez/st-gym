class AddColumnsToWorkouts < ActiveRecord::Migration[7.0]
  def change
    add_column :workouts, :saved, :boolean, default: false
    add_column :workouts, :original_workout, :string
  end
end
