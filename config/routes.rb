Rails.application.routes.draw do
  devise_for :stores
  devise_for :farms
  root to: 'items#index'
  resources :items, only: :index
end
