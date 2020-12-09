Rails.application.routes.draw do
  root 'matters#index'
  devise_for :users

  resources :matters

  resources :users do
    member do
      get 'logout'
    end
  end
  
end
