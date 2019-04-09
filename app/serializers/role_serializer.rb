class RoleSerializer < ActiveModel::Serializer

  has_many :track_categories

  def self.serialize_with_tracks(role)
  {
    tracks: self.serialize_track_categories(role.track_categories)
  }
  end

  def self.serialize_track_categories(track_categories)
    track_categories.map{ |track_category|
     self.serialize_tracks(track_category) }
  end

  def self.serialize_tracks(track_category)
    TrackSerializer.serialize_tracks(track_category.tracks)
  end
end