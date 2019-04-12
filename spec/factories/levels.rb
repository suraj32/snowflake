FactoryBot.define do
  factory :level, class: Level do
    seq_no { Faker::Number.between(1, 500) }
    description { Faker::Lorem.paragraph(3) }
    example_behaviour { Faker::Lorem.sentences(3) }
    example_task { Faker::Lorem.sentences(3) }
    track
  end
end