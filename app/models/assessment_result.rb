class AssessmentResult
  include Mongoid::Document
  field :total_points, type: Integer
  field :current_level, type: Float

  embeds_many :level_assessments
  belongs_to :cycle
  belongs_to :user
end
