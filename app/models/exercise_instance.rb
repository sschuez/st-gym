class ExerciseInstance < ApplicationRecord
  belongs_to :exercise
  belongs_to :block

  delegate :workout, to: :block

  acts_as_list scope: :block
  
  # validates :repetitions, :time, numericality: { bigger_or_equal_to: 0 }

  after_create_commit do
    broadcast_append_later_to block, :exercise_instances, 
      target: "block_#{block.id}_exercise_instances", 
      partial: "exercise_instances/exercise_instance", 
      locals: { exercise_instance: self }
  end

  after_update_commit do
    broadcast_replace_later_to block, :exercise_instances, 
      target: "exercise_instance_#{self.id}", 
      partial: "exercise_instances/exercise_instance",
      locals: { exercise_instance: self }
  end

  after_destroy_commit do
    broadcast_remove_to block, :exercise_instances,
      target: "exercise_instance_#{self.id}"
  end

  def duration
    seconds_exercises = tabata ? time : repetitions * exercise.duration
    seconds_exercises + seconds_for_rest()
  end
  
  def seconds_for_rest
    5
  end
end
