class TrackCategory
  include Mongoid::Document
  field :name, type: String
  field :description, type: String

  has_many :tracks
  belongs_to :role

  validates :name, presence: true, uniqueness: true
end