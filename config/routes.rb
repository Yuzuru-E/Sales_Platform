Rails.application.routes.draw do
  root 'matters#index'
  devise_for :users

  resources :matters 

  resources :users do
    get 'get_industry_children', defaults: { format: 'json' }
    get 'get_industry_grandchildren', defaults: { format: 'json' }
    collection do
      get 'get_industry_children', defaults: { format: 'json' }
      get 'get_industry_grandchildren', defaults: { format: 'json' }
    end
    member do
      get 'logout'
    end
  end
  resources :clients
  resources :contractors
  
end
