Wedding::Application.routes.draw do

  resources :sessions
  resources :users

  root 'home#index'

end
