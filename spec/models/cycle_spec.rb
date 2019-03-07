require 'rails_helper'

RSpec.describe Cycle do

	it { should be_mongoid_document }

	it { should have_many(:assessment_results) }

end