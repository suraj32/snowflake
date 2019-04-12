class LevelSerializer < ActiveModel::Serializer

  attributes :id, :seq_no, :description, :example_behaviour, :example_task

  belongs_to :track

end