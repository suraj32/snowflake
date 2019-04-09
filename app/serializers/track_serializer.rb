class TrackSerializer < ActiveModel::Serializer

  attributes :name, :description
  
  has_many :levels

  def self.serialize_tracks(tracks)
    tracks.map{|track| self.serialize_track(track)}
  end

  def self.serialize_track(track)
  {
    "#{track.name.upcase}": 
    {
    displayName: track.name,  
    category: track.track_category.name,
    description: track.description,
    milestones: ActiveModel::SerializableResource.new(track.levels).as_json
    }
  }
  end
end