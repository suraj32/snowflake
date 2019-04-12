class LevelAssessment
  
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :user_id,           type: Integer
  field :role_id,           type: Integer
  field :track_id,          type: Integer
  field :level_id,          type: Integer
  field :cycle_id,          type: Integer
  field :updated_by,        type: String
  field :Comments,          type: String
  field :track_category_id, type: Integer

  belongs_to :assessment_result

  validates :user_id, :role_id, :track_category_id,
   :track_id, :level_id, presence: true
end