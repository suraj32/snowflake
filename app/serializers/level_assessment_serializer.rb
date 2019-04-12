class LevelAssessmentSerializer < ActiveModel::Serializer

  attributes :id, :role_id, :track_category_id, :track_id, :level_id

  belongs_to :assessment_result
end