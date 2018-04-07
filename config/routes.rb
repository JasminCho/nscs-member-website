Rails.application.routes.draw do
  
  get '/upload', to: 'uploads#index'

  get '/login', to: 'user#login'

  get 'newsfeeds/index'
  get 'newsfeeds/new'
  post 'newsfeeds/create'
  get 'newsfeeds/edit'
  patch 'newsfeeds/update'
  delete 'newsfeeds/destroy'
  
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
  resource :members

  #calendar routes
  get 'calendars/get_calendars', to: 'calendars#get_calendars', as: 'calendar'
#  get 'calendars/get_calendars/callback', to: redirect('/')
  # below are routes needed for google authentication
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :uploads
  
  resources :sessions, only: [:create, :destroy]
  
  root 'user#login'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
