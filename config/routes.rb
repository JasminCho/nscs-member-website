Rails.application.routes.draw do
  
  get '/login', to: 'user#login'

  get 'newsfeeds/new'
  get 'newsfeeds/create'
  get 'newsfeeds/edit'
  get 'newsfeeds/update'
  get 'newsfeeds/destroy'
  
  resources :newsfeeds

  get 'sessions/create'
  get 'sessions/destroy'

  get '/about', to: 'members#about'
  get '/home', to: 'members#home'
  get '/faq', to: 'members#faq'
  get '/officers', to: 'members#officers'
  get '/contact', to: 'members#contact'
  get '/meetings', to: 'members#meetings'
  get '/points', to: 'members#points'

  # members' routes
  get 'members/index', to: 'members#index'

  #calendar routes
  get 'calendars/get_events', to: 'calendars#list_events', as: 'list_events'
  get 'calendars/show_event', to: 'calendars#show_event', as: 'show_event'
  get 'calendars/login', to: 'calendars#current_user', as: 'login_calendar'
  get 'calendars/new_event', to: 'calendars#insert_event', as: 'new_event'
  #  get 'calendars/get_calendars/callback', to: redirect('/')
  # below are routes needed for google authentica tion

  get 'events/new', to: 'events#new', as: 'new_events'
  post 'events/create', to: 'events#create', as: 'create_event'
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'
  
  resources :sessions, only: [:create, :destroy]
  
  root 'user#login'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
