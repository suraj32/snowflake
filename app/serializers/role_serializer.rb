class RoleSerializer < ActiveModel::Serializer

  attributes :id, :name

  has_many :track_categories

  # def self.serialize_with_tracks(role)
  # {
  #   tracks: self.serialize_track_categories(role.track_categories)
  # }
  # end

  # def self.serialize_track_categories(track_categories)
  #   track_categories.map{ |track_category|
  #    self.serialize_tracks(track_category)
  #   }
  # end

  # def self.serialize_tracks(track_category)
  #   TrackSerializer.serialize_tracks(track_category.tracks)
  # end

  # def self.serialize_with_roles(roles)
  # {
  #   Roles: ActiveModelSerializers::SerializableResource.new(roles).as_json
  # }
  # end

  # class TrackCategorySerializer < ActiveModel::Serializer

  #   attributes :id, :name, :description

  #   has_many :tracks

  #   class TrackSerializer < ActiveModel::Serializer

  #     attributes :id, :name, :description

  #     has_many :levels

  #     class LevelSerializer < ActiveModel::Serializer

  #       attributes :id, :seq_no, :description, :example_behaviour, :example_task

  #     end
  #   end
  # end

  # def track_categories
  #   customized_categories = []

  #   object.track_categories.each do |category|
  #     customized_category = category.attributes
  #   end
  #   customized_categories
  # end
end