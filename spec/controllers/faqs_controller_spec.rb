require 'rails_helper'

RSpec.describe FaqsController, type: :controller do
    describe 'GET index' do
        it 'assigns @faqs' do
            get :index
            expect(assigns(@faqs)).not_to be_nil
        end
    end

    describe 'POST new' do
        it 'assigns @faqs' do
            post :new
            expect(assigns(@faqs)).not_to be_nil
        end
    end

    describe 'POST create' do
        it 'receives correct arguments' do
            post :create, :params => {:question => 'some question', :answer => 'some answer'}
            expect(controller.params[:question]).not_to be_nil
            expect(controller.params[:answer]).not_to be_nil
        end
    end

    describe 'POST edit' do
        it 'receive an id' do
            put :edit, :params => {:id => 1}
            expect(controller.params[:id]).not_to be_nil
        end 
    end

    describe 'PUT update' do
        it 'receives an id' do 
            put :update, :params => {:id => 1}
            expect(controller.params[:id]).not_to be_nil
        end
    end
end
