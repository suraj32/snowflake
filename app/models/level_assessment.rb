class LevelAssessment
  include Mongoid::Document
  field :user_id, type: Integer
  field :role_id, type: Integer
  field :track_category_id, type: Integer
  field :track_id, type: Integer
  field :level_id, type: Integer
  field :updated_by, type: String
  field :Comments, type: String

  belongs_to :assessment_result

  validates :user_id, :role_id, :track_category_id, :track_id, :level_id, :updated_by, presence: true
end
