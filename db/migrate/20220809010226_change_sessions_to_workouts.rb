class ChangeSessionsToWorkouts < ActiveRecord::Migration[7.0]
  def self.up
    rename_table :sessions, :workouts
  end

  def self.down
    rename_table :workouts, :sessions
  end
end
