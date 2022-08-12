CATEGORIES = ["Pull", "Push", "Cardio", "Back", "Legs", "Chest", "Belly", "Arms", "Shoulders"]

progressbar = ProgressBar.create(
  title: 'Creating Categories',
  total: CATEGORIES.count
)

CATEGORIES.each do |category|
  unless Category.find_by(name: category)
    Category.create(name: category)
    progressbar.increment
  end
end
