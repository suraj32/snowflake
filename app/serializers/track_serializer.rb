class TrackSerializer < ActiveModel::Serializer

  attributes :id, :name, :description
  
  has_many :levels
  belongs_to :track_category

  # def self.serialize_tracks(tracks)
  #   tracks.map{|track| self.serialize_track(track)}
  # end

  # def self.serialize_track(track)
  # {
  #   "#{track.name.upcase}": 
  #   {
  #   displayName: track.name,  
  #   category: track.track_category.name,
  #   description: track.description,
  #   milestones: ActiveModel::SerializableResource.new(track.levels).as_json
  #   }
  # }
  # end

  # def self.serialize_with_tracks(tracks)
  #   tracks.map{ |track|
  #     LevelSerializer.serialize_with_levels(track.levels)
  #   }
  # end
end