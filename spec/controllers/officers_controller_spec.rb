require 'rails_helper'

RSpec.describe OfficersController, type: :controller do
  describe 'GET index' do
    it 'assigns @officiers' do
      get :index
      expect(assigns(@officiers)).not_to be_nil
    end
  end
    
  describe 'CREATE' do
    it 'receive needed params' do
        put :create, :params => {:officer => ''}
        expect(controller.params[:officer]).not_to be_nil
    end
  end
  
  describe 'POST new' do
    it 'creates new empty officer' do
      post :new
      expect(assigns(@officer)).not_to be_nil
    end
  end

  describe 'put EDIT' do
    it 'receives non-nil id' do
      put :edit, params: { id: 1 }
      expect(controller.params[:id]).not_to be_nil
    end
  end

  describe 'delete :destroy' do
    it 'receives non-nil id' do
      delete :destroy, params: { id: 1 }
      expect(controller.params[:id]).not_to be_nil
    end
  end
end
