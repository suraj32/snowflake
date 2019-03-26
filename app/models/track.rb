class Track
  
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :name, type: String
  field :description, type: String

  has_many :levels
  belongs_to :track_category

  validates :name, presence: true
end