CATEGORIES = ["functional", "gym", "pull", "push", "cardio", "back", "legs", "chest", "belly", "arms", "shoulders"]

progressbar = ProgressBar.create(
  title: 'Creating Categories',
  total: CATEGORIES.count
)

CATEGORIES.each do |category|
  unless Category.find_by(name: category)
    new_category = Category.create(name: category)
    
    if category == "functional" || category == "gym"
      new_category.update(main_category: true)
    end

    progressbar.increment
  end
end
