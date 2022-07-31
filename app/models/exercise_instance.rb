class ExerciseInstance < ApplicationRecord
  belongs_to :exercise
  belongs_to :block

  broadcasts_to :block
end
