class Track
  include Mongoid::Document
  field :name, type: String
  field :description, type: String

  embeds_many :levels
  embedded_in :track_category

  validates :name, presence: true, uniqueness: true
end
