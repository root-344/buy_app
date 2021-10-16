Rails.application.routes.draw do
  devise_for :stores, controllers: {
    sessions:      'stores/sessions',
    passwords:     'stores/passwords',
    registrations: 'stores/registrations'
  }
  devise_for :farms, controllers: {
    sessions:      'farms/sessions',
    passwords:     'farms/passwords',
    registrations: 'farms/registrations'
  }
  root to: 'items#index'
  resources :items, only: [:index, :new, :create, :show]
end
