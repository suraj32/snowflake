require 'rails_helper'

RSpec.describe AssessmentResult do

  it { should be_mongoid_document }

  it { should have_many :level_assessments }
  it { should belong_to :cycle }
  it { should belong_to :user }
  
  it { should validate_presence_of(:total_points) }
  it { should validate_presence_of(:current_level) }
  it { should validate_presence_of(:points_to_next_level) }

end