class Role
  
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :name, type: String

  has_many :users
  has_many :track_categories

  validates :name, presence: true, uniqueness: true
end