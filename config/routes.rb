Wedding::Application.routes.draw do

  resources :sessions

  resources :users do
    resources :consumer_contacts
    resources :service_contacts
    resources :marriages
  end

  root 'home#index'

end
