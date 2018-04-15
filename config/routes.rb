Rails.application.routes.draw do
  
  get 'photos/new'
  get 'photos/create'
  get 'photos/index'

  get 'meetings/new'
  get 'meetings/create'
  get 'meetings/index'
  delete 'meetings/destroy'

  get '/upload', to: 'uploads#index'

  get '/login', to: 'user#login'
  
  get '/officers', to: 'officers#index'
  
  get '/about', to: 'general_pages#about'
  get '/home', to: 'general_pages#home'
  get '/admin_page', to: 'general_pages#AdminPage'

  get 'newsfeeds/index'
  get 'newsfeeds/new'
  post 'newsfeeds/create'
  get 'newsfeeds/edit'
  patch 'newsfeeds/update'
  delete 'newsfeeds/destroy'
  
  resources :newsfeeds

  get 'sessions/create'
  get 'sessions/destroy'

  get '/faq', to: 'members#faq'
  get '/officers', to: 'members#officers'
  get '/contact', to: 'members#contact'
  #get '/meetings', to: 'members#meetings'
  get '/points', to: 'members#points'

  # members' routes
  get 'members/index', to: 'members#index'
  resource :members

  # points' routes
  get 'points/index', to: 'points#index'
  resource :points
  
  #calendar routes
  get 'calendars/get_events', to: 'calendars#list_events', as: 'list_events'
  get 'calendars/show_event', to: 'calendars#show_event', as: 'show_event'
  get 'calendars/login', to: 'calendars#current_user', as: 'login_calendar'
  get 'calendars/new_event', to: 'calendars#insert_event', as: 'new_event'
  #  get 'calendars/get_calendars/callback', to: redirect('/')
  # below are routes needed for google authentica tion

  get 'calendars/new', to: 'calendars#new_event', as: 'new_events'
  post 'calendars/create', to: 'calendars#create_event', as: 'create_event'
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :uploads
  resources :meetings
  resources :photos
  
  resources :sessions, only: [:create, :destroy]
  
  root 'user#login'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
