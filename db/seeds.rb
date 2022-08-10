# USERS_TO_CREATE = 5
# EXERCISES_TO_CREATE = 10
# etc

Dir[Rails.root.join('db', 'seeds', '*.rb')].sort.each do |file|
  require file
end
