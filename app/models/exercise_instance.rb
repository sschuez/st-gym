class ExerciseInstance < ApplicationRecord
  belongs_to :exercise
  belongs_to :block

  delegate :session, to: :block

  # broadcast_append_to block, :exercise_instances, target: "#{dom_id(block)}_exercise_instances", partial: 'exercise_instances/exercise_instance'
end
