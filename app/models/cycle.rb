class Cycle

  include Mongoid::Document
  include Mongoid::Timestamps

  field :emp_duration_start,     type: Date
  field :emp_duration_end,       type: Date
  field :manager_duration_start, type: Date
  field :manager_duration_end,   type: Date
  field :is_open,                type: Boolean

  has_many :assessment_results

  validates :emp_duration_start, :emp_duration_end, 
   :manager_duration_start, :manager_duration_end, 
   :is_open, presence: true
end