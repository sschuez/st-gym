CATEGORIES = %w[functional gym pull push cardio back legs chest belly arms shoulders].freeze

progressbar = ProgressBar.create(
  title: "Creating Categories",
  total: CATEGORIES.count
)

CATEGORIES.each do |category|
  next if Category.find_by(name: category)

  new_category = Category.create(name: category)

  if %w[functional gym].include?(category)
    new_category.update(main_category: true)
  end

  progressbar.increment
end
