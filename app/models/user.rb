class User
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :name, type: String
  field :email, type: String
  field :password, type: String
  field :mobile_no, type: Integer

  has_many :assessment_results
  belongs_to :role

  validates :name, presence: true, length: { minimum: 6 }
  validates :email, presence: true, uniqueness: true,
   format: {with: /\A.+@#{"joshsoftware.com"}/,
   message: "Only #{"joshsoftware.com"} email-id is allowed."}
  validates :mobile_no, length: { is: 10 }, allow_nil: true
end