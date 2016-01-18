Rails.application.routes.draw do

  root 'home#index'

  get '/cart', to: 'cart_items#show'
  get '/dashboard', to: 'users#show'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :cart_items, only: [:create, :update, :destroy]
  resources :items, only: [:index, :show]
  resources :orders, only: [:index, :show]
  resources :travesties, only: [:show], param: :slug do
    resources :items, only: [:index]
  end

  namespace :admin do
    get '/dashboard', to: 'base#show'
    resources :items, only: [:new, :create, :index, :destroy]
  end

  resources :users, only: [:new, :create]
end
