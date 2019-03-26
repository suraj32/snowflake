require 'rails_helper'

RSpec.describe Level do

  it { should be_mongoid_document }

  it { should belong_to(:track) }

  it { should validate_presence_of(:seq_no) }
  
end