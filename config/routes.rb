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

  # below are routes needed for google authentication
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :sessions, only: [:create, :destroy]
  
  root 'user#login'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
