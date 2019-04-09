class TrackCategorySerializer < ActiveModel::Serializer
	attributes :name
	has_many :tracks
	belongs_to :role
end