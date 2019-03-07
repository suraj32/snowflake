require 'rails_helper'

RSpec.describe LevelAssessment do

	it { should be_mongoid_document }

	it { should be_embedded_in(:assessment_result) }
		
end