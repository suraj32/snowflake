FactoryBot.define do
  factory :track_category, class: TrackCategory do
    name { Faker::Job.field }
    description { Faker::Lorem.paragraph(3) }
    role
  end
end