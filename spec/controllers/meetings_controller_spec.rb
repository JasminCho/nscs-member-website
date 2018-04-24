require 'rails_helper'

RSpec.describe MeetingsController, type: :controller do

  describe "DELETE destroy" do
    it "receives it param" do
      delete :destroy, :params => {:id => 1}
      expect(controller.params[:id]).not_to be_nil
    end
  end

  describe "GET #create" do
    it "receive basic arguments" do
      post :create, :params => {:file => 'some file name'}
      expect(controller.params[:file]).not_to be_nil
    end
  end

  describe "GET #index" do
    it 'assigns @meetins' do
      get :index
      expect(assigns(@meetings)).not_to be_nil
    end
  end

end
