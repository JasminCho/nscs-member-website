require 'rails_helper'

RSpec.describe MembersController, type: :controller do
  describe 'GET index' do
    it 'assigns @members' do
      get :index
      expect(assigns(:members)).not_to eq(nil)
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end

  end

  describe 'CREATE member' do
    it 'receives non-nil arguments' do
      post :create, :params => {:email => "email", :name =>"name", :admin => true, :pace => true}
      expect(controller.params[:name]).not_to be_nil
    end

    it 'receives correct arguments' do
      post :create, :params => {:email => "email", :name =>"name", :admin => true, :pace => true}
      expect(controller.params[:name]).to eq("name")
      expect(controller.params[:email]).to eq("email")
      expect(controller.params[:admin]).to eq("true")
      expect(controller.params[:pace]).to eq("true")
    end

  end
end