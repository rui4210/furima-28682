Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :items, only: [:index, :new, :create, :show]
  resources :item_purchases, only: [:new, :create]
end
