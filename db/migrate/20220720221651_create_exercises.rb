class CreateExercises < ActiveRecord::Migration[7.0]
  def change
    create_table :exercises do |t|
      t.string :name
      t.text :description
      t.belongs_to :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
