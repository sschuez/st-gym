class AddAhoyToWorkouts < ActiveRecord::Migration[7.0]
  def change
    add_column :workouts, :ahoy_visit_id, :bigint
  end
end
