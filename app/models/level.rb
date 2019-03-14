class Level
  include Mongoid::Document
  field :seq_no, type: Integer
  field :description, type: String
  field :example_behaviour, type: Array
  field :example_task, type: Array

  embedded_in :track

  validates :seq_no, presence: true
end