Rails.application.routes.draw do

  devise_for :users
  resources :universities do
  	resources :reviews
  end
  root 'universities#index'
 end
