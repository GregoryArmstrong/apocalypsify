Rails.application.routes.draw do

  resources :items, only: [:index]

  resources :travesties, only: [:show], param: :slug do
    resources :items, only: [:index]
  end

  get '/cart', to: 'carts#show'

  resources :cart_items, only: [:create]
end