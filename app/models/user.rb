class User
  include Mongoid::Document
  field :name, type: String
  field :email, type: String
  field :password, type: String
  field :mobile_no, type: Integer

  embedded_in :roles

  validates :email, uniqueness: true, format: {with: /\A.+@#{"joshsoftware.com"}/, message: "Only #{"joshsoftware.com"} email-id is allowed."}
  validates :name, presence: true
  validates :mobile_no, length: { is: 10 }
end
