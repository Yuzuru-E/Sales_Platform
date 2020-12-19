Rails.application.routes.draw do
  root 'matters#index'
  devise_for :users

  resources :matters 

  resources :users do
    resources :clients, only: [:new, :edit]
    resources :contractors, only: [:new, :edit]
    member do
      get 'logout'
    end
  end
  
end
