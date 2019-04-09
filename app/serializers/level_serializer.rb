class LevelSerializer < ActiveModel::Serializer

  attributes :description, :example_behaviour, :example_task

  def self.serialize_levels(levels)
    levels.map{|level| self.serialize_level(level) }    
  end

  def self.serialize_level(level)
  {
    summary: level.description,
    signals: level.example_behaviour,
    examples: level.example_task
  }
  end
end