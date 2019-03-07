class LevelAssessment
  include Mongoid::Document
  field :user_id, type: Integer
  field :role_id, type: Integer
  field :track_category_id, type: Integer
  field :track_id, type: Integer
  field :level_id, type: Integer
  field :updated_by, type: String
  field :Comments, type: String

  embedded_in :assessment_result
end
