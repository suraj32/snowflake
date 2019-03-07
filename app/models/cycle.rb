class Cycle
  include Mongoid::Document
  field :emp_duration_start, type: DateTime
  field :emp_duration_end, type: DateTime
  field :manager_duration_start, type: DateTime
  field :manager_duration_end, type: DateTime
  field :is_open, type: Boolean

  has_many :assessment_results
end
