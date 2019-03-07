FactoryBot.define do
  factory :level_assessment do
    user_id { "" }
    role_id { "" }
    track_category_id { "" }
    track_id { "" }
    level_id { "" }
    updated_by { "" }
    Comments { "" }
    assessment_results { nil }
  end
end
