# frozen_string_literal: true

Rails.application.routes.draw do
  # RESTful routes
  resources :examples, except: %i[new edit]
  resources :users, only: %i[index show update]
  resources :guitars, except: %i[new edit]
  resources :user_guitars, except: %i[new edit]
  resources :setups, except: %i[new edit]


  # Custom routes
  post '/sign-up' => 'users#signup'
  post '/sign-in' => 'users#signin'
  delete '/sign-out' => 'users#signout'
  patch '/change-password' => 'users#changepw'
  get '/user_guitars/avg_price' => 'user_guitars#avg_price'
end
