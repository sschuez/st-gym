class ExerciseInstance < ApplicationRecord
  belongs_to :exercise
  belongs_to :block

  delegate :session, to: :block
  
  validates :repetitions, :time, numericality: { bigger_or_equal_to: 0 }

  after_create_commit do
    broadcast_append_to block, :exercise_instances, 
      target: "block_#{block.id}_exercise_instances", 
      partial: "exercise_instances/exercise_instance", 
      locals: { exercise_instance: self }
  end

  after_update_commit do
    broadcast_replace_to block, :exercise_instances, 
      target: "exercise_instance_#{self.id}", 
      partial: "exercise_instances/exercise_instance",
      locals: { exercise_instance: self }
  end
  
end
