require 'rails_helper'

RSpec.describe TrackCategory do

	it { should be_mongoid_document }

	it { should embed_many(:tracks) }
	it { should be_embedded_in(:role) }

	it { should validate_presence_of(:name) }
	it { should validate_uniqueness_of(:name) }
		
end