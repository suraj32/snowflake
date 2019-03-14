require 'rails_helper'

RSpec.describe Track do

	it { should be_mongoid_document }

	it { should embed_many(:levels) }
	it { should be_embedded_in(:track_category) }

	it { should validate_presence_of(:name) }
	it { should validate_uniqueness_of(:name) }
	
end