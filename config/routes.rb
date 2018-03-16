Rails.application.routes.draw do
  get 'sessions/create'

  get 'sessions/destroy'

  get 'members/login'
  get 'members/about'
  get 'members/faq'

  # below are routes needed for google authentication
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :sessions, only: [:create, :destroy]
  
  root "members#login"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
