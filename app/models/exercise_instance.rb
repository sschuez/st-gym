class ExerciseInstance < ApplicationRecord
  belongs_to :exercisable, polymorphic: true
  belongs_to :exercise
end
