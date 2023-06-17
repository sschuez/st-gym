exercises = [ 
  {name: "Jumping jack", description: "Make little jumps, spreading your legs. Gets your heart rate up!", category: "cardio"}, 
  {name: "Goblet squat", description: "Take a weight into your hands and make a deep squat. Make sure your weight is on the heels", category: "legs"},
  {name: "Pull up", description: "Go to a bar and pull yourself up.", category: "shoulders"},
  {name: "Sit up", description: "Sit on the floor and pull your upper body up and go down again.", category: "belly"},
  {name: "Push up", description: "Belly to floor, lift your whole body up with your arms.", category: "push"},
  {name: "plank", description: "Lift your body up from your belly onto your elbows and stay there.", category: "shoulders"},
  {name: "Burpee", description: "Come down from standing belly-on-the-floor, then lift yourself up again and jump.", category: "cardio"},
  {name: "Russian twist", description: "Sit on the floor and touch with your hands floor to your left and right", category: "belly"},
  {name: "Leg raise", description: "Lift your legs up and down, laying on your back", category: "belly"}
]

progressbar = ProgressBar.create(
  title: 'Creating exercises',
  total: exercises.count
)

exercises.each do |exercise|
  p exercise[:category]
  unless Exercise.find_by(name: exercise[:name])
    exercise = Exercise.create(
      name: exercise[:name],
      description: exercise[:description],
    )
    
    ExerciseCategory.create(
      exercise_id: exercise.id,
      category_id: Category.find_by(name: "functional").id
    )
    
    ExerciseCategory.create(
      exercise: exercise,
      category: Category.find_by(name: exercise[:category])
    )

    progressbar.increment
  end
end
