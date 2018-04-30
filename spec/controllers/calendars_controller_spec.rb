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
            event = Event.find_by_id(1)
            get :show_event, :params => {:event_id => event[:event_id]}
            expect(response.status).to eq(200)
            expect(response.content_type).to eq 'text/html'
        end
    end

    describe 'Creates the calendar in logging.' do
        it 'Creates the calendar if the user is logged in, otherwise returns (200)' do

            get :current_user, :session => {:email => 'ggregar@gmail.com'}
            #Is nil. There is nothing to do.
            expect(response.status).to eq(200)
        end
    end

    describe 'Creates a new event for the calendar.' do
        it 'Creates a new event given proper credentials' do
            get :current_user, :session => {:email => 'ggregar@gmail.com'}
            event = Event.find(1)
            new_event = Event.new

            new_event[:title] = "RSPec test"
            new_event[:description] = event[:description]
            new_event[:start_date] = event[:start_date]
            new_event[:end_date] = event[:end_date] 
            new_event[:location] = event[:location] 
            new_event[:start_time] =  Time.now
            new_event[:end_time] = (Time.now + 1.hour)


            post :create_event, :params => {:event => new_event}
            expect(resposne).to redirect(new_events_path)
        
        end
    end

    describe 'Fails to create the calendar due to invalid loggin.' do
        it 'Redirects to the root path.' do
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
            #Fails to make the call.
            #Saves into the database however.
            expect(response.status).to eq(302)
            expect(response).to redirect_to(new_events_path)

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
