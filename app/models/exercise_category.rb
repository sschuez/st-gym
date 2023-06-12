class ExerciseCategory < ApplicationRecord
  belongs_to :exercise
  belongs_to :category
  
  validates :category, uniqueness: { scope: :exercise, message: "already added" } 
end
