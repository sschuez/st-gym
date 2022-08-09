exercises = [ 
  {name: "Jumping jack", description: "Make little jumps, spreading your legs. Gets your heart rate up!", category: "Cardio"}, 
  {name: "Goblet squat", description: "Take a weight into your hands and make a deep squat. Make sure your weight is on the heels", category: "Legs"},
  {name: "Pull up", description: "Go to a bar and pull yourself up.", category: "Shoulders"},
  {name: "Sit up", description: "Sit on the floor and pull your upper body up and go down again.", category: "Belly"}
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
