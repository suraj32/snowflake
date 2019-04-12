FactoryBot.define do
  factory :assessment_result, class: AssessmentResult do
    total_points { Faker::Number.between(1, 100) }
    current_level { Faker::Number.decimal(1) }
    points_to_next_level { Faker::Number.between(1, 50) }
    cycle
    user
  end
end