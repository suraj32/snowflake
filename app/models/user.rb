class User
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :email, type: String
  field :password, type: String
  field :role, type: String, default: 'Employee'

  has_many :assessment_results

end