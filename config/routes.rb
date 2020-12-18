Rails.application.routes.draw do
  root 'matters#index'
  devise_for :users

  resources :matters 

  resources :users do
    resources :client, only: [:new, :edit]
    resources :contractor, only: [:new, :edit]
    member do
      get 'logout'
    end
  end
  
end
