class AssessmentResult

  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :total_points, type: Integer
  field :current_level, type: Float

  has_many :level_assessments
  belongs_to :cycle
  belongs_to :user

  validates :total_points, :current_level, presence: true
end