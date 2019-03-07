require 'rails_helper'

RSpec.describe Role do

	it { should be_mongoid_document }

	it { should have_many :users }
	it { should embed_many :track_categories }
	
	it { should validate_presence_of(:name) }
	it { should validate_uniqueness_of(:name) }

end