namespace :lonely_workouts do
  desc "Clear all workouts that have no owner and are older than 24h"
  task clear: :environment do
    puts "Removing all workouts that have no owner and are older than 24h"
    Workout.lonely_and_due.destroy_all
    put "Done!"
  end

end
