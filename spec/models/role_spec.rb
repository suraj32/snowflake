require 'rails_helper'

RSpec.describe Role do
	describe 'Validations' do
	  role = FactoryBot.create(:role)
		it { is_expected.to be_mongoid_document }
		it { is_expected.to validate_uniqueness_of(:name) }
		role1 = FactoryBot.build(:role, name: role.name)
		it '' do
			expect(role1.valid?).to eq false
		end
	end
end
