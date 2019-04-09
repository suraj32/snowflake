require 'rails_helper'

RSpec.describe Cycle do

  it { should be_mongoid_document }

  it { should have_many(:assessment_results) }

  it { should validate_presence_of(:emp_duration_start) }
  it { should validate_presence_of(:emp_duration_end) }
  it { should validate_presence_of(:manager_duration_start) }
  it { should validate_presence_of(:manager_duration_end) }
  it { should validate_presence_of(:is_open) }
  
end