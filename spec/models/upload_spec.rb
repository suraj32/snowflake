require 'rails_helper'

RSpec.describe Upload do

  it { should be_mongoid_document }

  it { should validate_presence_of(:type_of_file) }
  it { should validate_presence_of(:input_file) }

end