Wedding::Application.routes.draw do

  resources :sessions

  resources :users do
    resources :consumer_contacts
    resources :service_contacts
    resources :marriages
    resources :posts
  end

  resources :marriages do
    resources :events
    resources :jobs
  end

  root 'home#index'

end
