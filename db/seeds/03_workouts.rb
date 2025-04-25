progressbar = ProgressBar.create(
  title: "Creating workouts for each category",
  total: CATEGORIES.count
)

CATEGORIES.each do |category|
  # Workouts
  workout = Workout.new(
    name: "Happy #{category}",
    description: "Workout to train #{category}",
    user: User.find_by(email: "stephens@hey.com")
  )
  workout.save

  # Blocks
  3.times do
    block = workout.blocks.new(workout: workout)
    block.save
  end

  # Exercise Instances
  workout.blocks.each do |block|
    exercise_instance = ExerciseInstance.new(
      block: block,
      exercise: Exercise.all.sample
    )

    exercise_instance.save
  end

  progressbar.increment
end
