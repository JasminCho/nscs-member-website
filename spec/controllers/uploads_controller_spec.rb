require 'rails_helper'

RSpec.describe UploadsController, type: :controller do

  describe "GET #index" do
    it "assigns @upload" do
      get :index
      expect(assigns(@uploads)).not_to be_nil
    end
  end

  describe "GET #create" do
    it "returns http success" do
      get :create
      # expect(response).to have_http_status(:success)
    end
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      # expect(response).to have_http_status(:success)
    end
  end

end
