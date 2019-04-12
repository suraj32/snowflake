require 'rails_helper'
require 'rspec_api_documentation/dsl'
DatabaseCleaner.clean

resource 'Users' do
  explanation 'Orders resource'

  header 'Content-Type', 'application/json' 

  let!(:user1) { create(:user) }
  let!(:role1) { create(:role) }
  let!(:track_category1) { create(:track_category, role: role1) }
  let!(:track_category2) { create(:track_category, role: role1) }
  let!(:track11) { create(:track, track_category: track_category1) }
  let!(:track12) { create(:track, track_category: track_category1) }
  let!(:track21) { create(:track, track_category: track_category2) }
  let!(:track22) { create(:track, track_category: track_category2) }
  let!(:level111) { create(:level, track: track11) }
  let!(:level112) { create(:level, track: track11) }
  let!(:level121) { create(:level, track: track12) }
  let!(:level122) { create(:level, track: track12) }
  let!(:level211) { create(:level, track: track21) }
  let!(:level212) { create(:level, track: track21) }
  let!(:level221) { create(:level, track: track22) }
  let!(:level222) { create(:level, track: track22) }

  get '/snowflake/v1/get_static_data' do

    example 'Getting static data if user_id not provided' do
      do_request()
      expect(status).to eq(200)
    end

    example 'Getting static data if user_id provided' do
      params = {}
      user1.role = role1.name
      user1.save
      params['user_id'] = user1.id

      do_request(params)
      expect(status).to eq(200)
    end
  end

  post '/snowflake/v1/get_assessment' do

    example 'get assessment data of a specific user' do
      params = {}
      user1.role = role1.name
      user1.save
      params['user_id'] = user1.id
      
      do_request(params)
      expect(status).to eq(200)
    end
  end
end