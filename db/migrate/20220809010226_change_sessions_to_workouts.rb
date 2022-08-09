class ChangeSessionsToWorkouts < ActiveRecord::Migration[7.0]
  def change
    rename_table :sessions, :workouts
    rename_column :blocks, :session_id, :workout_id
  end
end
