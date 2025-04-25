FactoryBot.define do
  factory :user do
    id { 2 }
    email { "test@test.com" }
    password { "password" }
    admin { false }
  end
end
