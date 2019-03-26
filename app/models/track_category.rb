class TrackCategory
  
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :name, type: String
  field :description, type: String

  has_many :tracks
  belongs_to :role

  validates :name, presence: true
end