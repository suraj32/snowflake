FactoryBot.define do
  factory :level_assessment, class: LevelAssessment do
    user
    role
    track_category
    track
    level
    cycle
  end
end