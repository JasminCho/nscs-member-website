require 'rails_helper'

RSpec.describe PointsController, type: :controller do
  describe 'New point' do 
    it 'receieves non-nil arguments' do 
        post :new
        expect(assigns(@point)).not_to be_nil
    end
  end

  describe 'Destroy point' do
    it 'receive correct arguments' do
        delete :destroy, :params => {:id => 1, :email => 'email'}
        expect(controller.params[:id]).not_to be_nil
        exepct(controller.params[:email]).not_to be_nil
    end  
  end
end


