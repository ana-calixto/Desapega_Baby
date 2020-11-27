Rails.application.routes.draw do
  devise_for :users
  root to: 'products#index'
  resources :products do
    resources :deals, only: [:create]
  end

  resources :deals, only: [:show]

  resources :profiles do
    resources :users, only: [ :show ]
  end

  resources :users do
      resources :reviews, only: [ :new, :create, :edit, :show ]
    end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
