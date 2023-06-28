FactoryBot.define do
  factory :post do
    title { "MyString" }
    user { nil }
    summary { "MyText" }
    published { false }
  end
end
