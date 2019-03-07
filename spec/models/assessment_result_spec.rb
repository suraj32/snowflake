require 'rails_helper'

RSpec.describe AssessmentResult do

	it { should be_mongoid_document }

	it { should embed_many :level_assessments }
	it { should belong_to :cycle }
	it { should belong_to :user }
		
end