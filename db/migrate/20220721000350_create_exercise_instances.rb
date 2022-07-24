class CreateExerciseInstances < ActiveRecord::Migration[7.0]
  def change
    create_table :exercise_instances do |t|
      # t.references :exercisable, polymorphic: true, index: true
      t.references :block, null: false, foreign_key: true
      t.references :exercise, null: false, foreign_key: true
      t.integer :repetitions
      t.integer :time

      t.timestamps
    end
  end
end
