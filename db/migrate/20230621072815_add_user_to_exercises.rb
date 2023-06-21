class AddUserToExercises < ActiveRecord::Migration[7.0]
  def change
    add_reference :exercises, :user, foreign_key: true
  end
end
