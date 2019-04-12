class AssessmentResultSerializer < ActiveModel::Serializer

  attributes :id, :total_points, :current_level, :points_to_next_level

  has_many :level_assessments
  belongs_to :user

end