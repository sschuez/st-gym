class ClearLonelyWorkoutsJob < ApplicationJob
  queue_as :default

  def perform
    Workout.lonely_and_due.each do |workout|
      puts "🔥 Destroying lonely workout #{workout.id}"
      DestroySingleWorkoutJob.perform_later(workout.id)
    end
  end
end
