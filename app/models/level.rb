class Level

  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :seq_no, type: Integer
  field :description, type: String
  field :example_behaviour, type: Array
  field :example_task, type: Array

  belongs_to :track

  validates :seq_no, presence: true
end