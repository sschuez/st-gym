module WorkoutsHelper
  def save_workout_for(user, workout)
    workout = Workout.find(workout)
    new_workout = Workout.new(
      name: workout.name,
      description: workout.description,
      user: user,
      public: false,
      saved: true,
      original_workout: workout.id
    )
    new_workout.save!
    workout.blocks.each do |block|
      new_block = new_workout.blocks.new(
        repetitions: block.repetitions,
        time: block.time,
        tabata: block.tabata,
        title: block.title,
        position: block.position
      )
      new_block.save
      block.exercise_instances.each do |exercise_instance|
        new_exercise_instance = new_block.exercise_instances.new(
          exercise: exercise_instance.exercise,
          repetitions: exercise_instance.repetitions,
          time: exercise_instance.time,
          tabata: exercise_instance.tabata,
          position: exercise_instance.position
        )
        new_exercise_instance.save
      end
    end
    return new_workout
  end
  
end
