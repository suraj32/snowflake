class Track
  include Mongoid::Document
  field :name, type: String
  field :description, type: String

  has_many :levels
  belongs_to :track_category

  validates :name, presence: true, uniqueness: true
end
