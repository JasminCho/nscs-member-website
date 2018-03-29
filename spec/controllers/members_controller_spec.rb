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
end