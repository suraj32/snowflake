class TrackCategory
  include Mongoid::Document
  field :name, type: String
  field :description, type: String
  field :indicators, type: Array

  embeds_many :tracks
  embedded_in :role

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true, length: { in: 10..500 }
end