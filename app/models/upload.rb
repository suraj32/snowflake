class Upload
  include Mongoid::Document
  field :select_type, type: String
  field :role_type, type: String
  field :track_category_type, type: String
  field :track_type, type: String
  field :level_type, type: String
  field :data, type: BSON::Binary
  field :filename, type: String
  field :mime_type, type: String
end
