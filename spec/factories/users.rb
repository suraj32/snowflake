FactoryBot.define do
  factory :user, class: User do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    mobile_no { Faker::Number.number(10) }
  end
end