class DropAhoyData < ActiveRecord::Migration[7.0]
  def change
    # Remove column from workouts
    remove_column :workouts, :ahoy_visit_id, :bigint if column_exists?(:workouts, :ahoy_visit_id)

    # Drop Ahoy tables if they exist
    drop_table :ahoy_events, if_exists: true
    drop_table :ahoy_visits, if_exists: true
  end
end
