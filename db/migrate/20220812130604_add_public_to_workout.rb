class AddPublicToWorkout < ActiveRecord::Migration[7.0]
  def change
    add_column :workouts, :public, :boolean, default: true
  end
end
