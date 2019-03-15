require 'rails_helper'

RSpec.describe User do

	it { should be_mongoid_document }
	it { should validate_presence_of(:name) }
	it { should validate_length_of(:name) }
	it { should validate_presence_of(:email) }
	it { should validate_uniqueness_of(:email) }
  it { should validate_length_of(:mobile_no) }

  it { should have_many(:assessment_results) }
  it { should belong_to(:role) }

  describe 'validate email format' do
    context 'when wrong email format is provided' do
    	it 'should raise error' do
        user = FactoryBot.build(:user, email: 'abc@def.com')
        expect(user).to_not be_valid
        expect(user.errors[:email]).to eq(["Only joshsoftware.com email-id is allowed."])
      end
    end

    it 'should not raise error when validate right format of email' do
      user = FactoryBot.build(:user, email: 'abc@joshsoftware.com')
      expect(user.errors[:email]).to eq([])
    end
  end
end