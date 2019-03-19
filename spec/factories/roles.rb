FactoryBot.define do
  factory :role, class: Role do
    name { Faker::Job.title }
  end
end