class ExerciseInstance < ApplicationRecord
  belongs_to :exercise
  belongs_to :block

  delegate :session, to: :block

  enum quantity: { more: 1, less: -1, cancel: 0 }

  # broadcasts_to :exercise_instances
  after_create_commit do
    broadcast_append_to block, :exercise_instances, target: "block_#{block.id}_exercise_instances", partial: "exercise_instances/exercise_instance"
  end

  # after_update_commit do
  #   broadcast_replace_to block, :exercise_instances, target: "block_#{block.id}_exercise_instances", partial: "exercise_instances/exercise_instance"
  # end
end
