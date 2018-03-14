Rails.application.routes.draw do
  get 'members/login'
  get 'members/about'
  get 'members/faq'
  
  root "members#login"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
