require 'spec_helper'
require_relative '../../app/controllers/newsfeeds_controller'

RSpec.configure do |config|
  config.infer_spec_type_from_file_location!
end

RSpec.describe NewsfeedsController, type: :controller do
  describe "GET index" do
    it 'assigns @newsfeeds' do
      newsfeeds = Newsfeed.all
      get :index
      expect(assigns(:newsfeeds)).to eq([newsfeeds])
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

end
