require 'rails_helper'

RSpec.describe GeneralPagesController, type: :controller do
    describe 'GET home' do
        it 'gets some newfeeds' do
            get :home
            expect(assigns(@newfeeds)).not_to be_nil
        end
    end
end
