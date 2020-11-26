Rails.application.routes.draw do
  devise_for :users
  root to: 'products#index'
  resources :products do
    resources :deals, only: [:create]
  end
  resources :charges
  resources :deals, only: [:show] do
    resources :payments, only: :new
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
8