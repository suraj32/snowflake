require 'rails_helper'
require 'rspec_api_documentation/dsl'
DatabaseCleaner.clean

resource 'Users' do
  explanation 'Orders resource'

  header 'Content-Type', 'application/json' 

  let(:user) { create(:user) }

  get '/snowflake/v1/get_static_data' do
    let(:level1) { create(:level) }
    let(:level2) { create(:level) }
    let(:level3) { create(:level) }
    let(:level4) { create(:level) }
    example 'Getting static data' do
      params = {}
      role = level1.track.track_category.role
      user.role = role.name
      user.save
      level2.track.track_category.role_id = role.id
      level2.track.track_category.save
      level3.track.track_category.role_id = role.id
      level3.track.track_category.save
      level4.track.track_category.role_id = role.id
      level4.track.track_category.role_id
      params['user_id'] = user.id

      do_request(params)
      expect(status).to eq(200)
    end
  end
end