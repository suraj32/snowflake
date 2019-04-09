require 'spec_helper'

RSpec.describe LevelsController, type: :controller do

  describe "GET #index" do
    it "returns success response" do 
      get :index, params: {}
      expect(response).to be_successful
    end
  end

end