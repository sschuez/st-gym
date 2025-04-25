Rails.logger.debug "Creating static users"

unless User.find_by(email: "stephens@hey.com")
  User.create email: "stephens@hey.com",
              password: "password",
              password_confirmation: "password",
              admin: true
end

unless User.find_by(email: "schuzste@gmail.com")
  User.create email: "schuzste@gmail.com",
              password: "password",
              password_confirmation: "password"
end

unless User.find_by(email: "test@gmail.com")
  User.create email: "test@gmail.com",
              password: "password",
              password_confirmation: "password"
end
