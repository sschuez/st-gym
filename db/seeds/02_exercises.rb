exercises = [ 
  {name: "Jumping jack", description: "Make little jumps, spreading your legs. Gets your heart rate up!", category: "Cardio"}, 
  {name: "Goblet squat", description: "Take a weight into your hands and make a deep squat. Make sure your weight is on the heels", category: "Legs"},
  {name: "Pull up", description: "Go to a bar and pull yourself up.", category: "Shoulders"},
  {name: "Sit up", description: "Sit on the floor and pull your upper body up and go down again.", category: "Belly"},
  {name: "Push up", description: "Belly to floor, lift your whole body up with your arms.", category: "Push"},
  {name: "Plank", description: "Lift your body up from your belly onto your elbows and stay there.", category: "Shoulders"},
  {name: "Burpee", description: "Come down from standing belly-on-the-floor, then lift yourself up again and jump.", category: "Cardio"},
  {name: "Russian twist", description: "Sit on the floor and touch with your hands floor to your left and right", category: "Belly"},
  {name: "Leg raise", description: "Lift your legs up and down, laying on your back", category: "Belly"}
]

progressbar = ProgressBar.create(
  title: 'Creating exercises',
  total: exercises.count
)

exercises.each do |exercise|
  unless Exercise.find_by(name: exercise[:name])
    Exercise.create(
      name: exercise[:name],
      description: exercise[:description],
      category: Category.find_by(name: exercise[:category])
    )
    progressbar.increment
  end
end
