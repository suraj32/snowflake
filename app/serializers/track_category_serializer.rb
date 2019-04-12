class TrackCategorySerializer < ActiveModel::Serializer

	attributes :id, :name, :description

	has_many :tracks
  belongs_to :role

  # def self.serialize_with_track_categories(track_categories)
  #   track_categories.map{ |track_category|
  #     TrackSerializer.serialize_with_tracks(track_category.tracks)
  #   }
  # end
end