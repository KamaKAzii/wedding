Wedding::Application.routes.draw do

  resources :sessions

  resources :users do
    resources :consumer_contacts
    resources :service_contacts
    resources :marriages
    resources :posts
    resources :photos
    resources :invites
    resources :appointments
  end

  resources :marriages do
    resources :events
    resources :jobs
  end

  get "job_tag_search", to: "jobs#tag_search"

  root 'home#index'

end
