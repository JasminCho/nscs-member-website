Rails.application.routes.draw do
  get 'static_pages/login'
  root "static_pages#login"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
