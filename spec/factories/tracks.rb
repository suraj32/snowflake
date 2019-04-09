FactoryBot.define do
  factory :track, class: Track do
    name { Faker::Job.key_skill }
    description { Faker::Lorem.paragraph(3) }
    track_category
  end
end