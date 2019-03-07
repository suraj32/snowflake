require 'rails_helper'

RSpec.describe Level do

	it { should be_mongoid_document }

	it { should be_embedded_in(:track) }

	it { should validate_presence_of(:seq_no) }
	it { should validate_presence_of(:description) }
	it { should validate_length_of(:description) }

end