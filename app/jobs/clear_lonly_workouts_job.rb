class ClearLonlyWorkoutsJob < ApplicationJob
  queue_as :default

  def perform(*args)
    puts "Removing all workouts that have no owner and are older than 24h"
    Workout.lonely_and_due.destroy_all
    puts "Done!"
  end
end
