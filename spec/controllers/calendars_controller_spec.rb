require 'rails_helper'
require 'ostruct'
require 'recursive-open-struct'
RSpec.describe CalendarsController, type: :controller do
    def stub_omniauth
        # first, set OmniAuth to run in test mode
        OmniAuth.config.test_mode = true
        # then, provide a set of fake oauth data that
        # omniauth will use when a user tries to authenticate:
        OmniAuth.config.mock_auth[:google] = OmniAuth::AuthHash.new({
          provider: "google",
          uid: "12345678910",
          info: {
            email: "jesse@mountainmantechnologies.com",
            first_name: "Jesse",
            last_name: "Spevack"
          },
          credentials: {
            token: "abcdefg12345",
            refresh_token: "12345abcdefg",
            expires_at: DateTime.now,
          }
        })
      end
    def stub_user

            auth = {
              provider: "google",
              uid: "12345678910",
              info: {
                email: "jesse@mountainmantechnologies.com",
                name: "Jesse",
                last_name: "Spevack"
              },
              credentials: {
                token: "abcdefg12345",
                refresh_token: "12345abcdefg",
                expires_at: Time.now
              }
            }

            data = RecursiveOpenStruct.new(auth)
            
          
            new_user = User.from_omniauth(data)

           # session[:user_id]=new_user.id
           # session[:email]=new_user.email
            new_user
        end


    describe  'Event can be seen' do
        it 'Fetches the event selected, if it exists on databse.' do
            
            controller = CalendarsController.new()
            #This is a default event. It is actually on the database.
            get :show_event, :params => {:event_id => 'rlr6kcd9imlq02078af6dg21co'}
            expect(response.status).to eq(200)
            expect(response.content_type).to eq 'text/html'
        end
    end

    describe 'create_calendars' do
        it 'Creates the calendar if the user is logged in, othrewise redirects.' do
            new_user = stub_user
            new_user.save
            get :current_user, :session => {:email => 'ggregar@gmail.com'}
            #Succeed. There is nothing to do.
            expect(response.status).to eq(204)
        end
    end

    describe 'create_calendars' do
        it 'Creates the calendar if the user is logged in, othrewise redirects.' do
            new_user = stub_user
            new_user.save
            get :current_user, :session => {:email => 'jesse@mountainmantechnologies.com'}
            #Performed Redirection since User is nill.
            expect(response.status).to eq(400)
            expect(response).to redirect_to(root_path)
        end
    end

    describe 'Gives the list of events' do
        it "Returns the list of events" do
            event = Event.new(:title => "Title", 
                :description => "Desc",
                :start_date => Date.new, 
                :end_date => Date.new + 1, 
                :location => "Location", 
                :calendar_id => "", 
                :start_time => Time.now, 
                :end_time => Time.now + 1)

            post :create_event , :params => {:event => event}
            expect(response.status).to eq(400)

        end
    end

    describe 'GET #list_events' do
        it "creates or updates itself from an oauth hash" do
              new_user = stub_user
              auth = {
                credentials: {
                  expires_at: new_user.oauth_expires_at
                }
              }
             # debugger
              expect(new_user.provider).to eq("google")
              expect(new_user.uid).to eq("12345678910")
              expect(new_user.email).to eq("jesse@mountainmantechnologies.com")
              expect(new_user.name).to eq("Jesse")
            #  expect(new_user.last_name).to eq("Spevack")
              expect(new_user.oauth_token).to eq("abcdefg12345")
              expect(new_user.refresh_token).to eq("12345abcdefg")
              expect(new_user.oauth_expires_at).to eq(auth[:credentials][:expires_at])

          
            end
        end
end
