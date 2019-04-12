require 'rails_helper'

RSpec.describe LevelAssessment do

  it { should be_mongoid_document }

  it { should belong_to(:assessment_result) }

  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:role_id) }
  it { should validate_presence_of(:track_category_id) }
  it { should validate_presence_of(:track_id) }
  it { should validate_presence_of(:level_id) }
  it { should validate_presence_of(:cycle_id) }
  it { should validate_presence_of(:updated_by) }

end