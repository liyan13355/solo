Rails.application.routes.draw do

  get 'braintree/new'
  resources :documents
  resources :users

  resources :sessions

  root "welcome#index", as: "home"

  post 'braintree/checkout'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
