require 'rails_helper'

RSpec.describe TrackCategory do

  it { should be_mongoid_document }

  it { should have_many(:tracks) }
  it { should belong_to(:role) }

  it { should validate_presence_of(:name) }
    
end