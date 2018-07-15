Rails.application.routes.draw do

  resources :documents
  resources :users

  resources :sessions

  root "welcome#index", as: "home"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
