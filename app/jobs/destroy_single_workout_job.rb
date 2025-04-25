class DestroySingleWorkoutJob < ApplicationJob
  queue_as :default

  def perform(workout_id)
    workout = Workout.find(workout_id)
    workout.destroy
    Rails.logger.debug { "🔥 Destroyed lonely workout #{workout_id}" }
  end
end
