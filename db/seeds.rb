return unless Rails.env.development?

# USERS_TO_CREATE = 5
# EXERCISES_TO_CREATE = 10
# etc

Rails.root.glob("db/seeds/*.rb").each do |file|
  require file
end
