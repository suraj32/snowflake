class Role
  include Mongoid::Document
  field :name, type: String

  has_many :users
  embeds_many :track_categories

  validates :name, presence: true, uniqueness: true
end
