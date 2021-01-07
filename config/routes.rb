Rails.application.routes.draw do
  root 'matters#index'
  devise_for :users

  resources :matters do
    collection do
      get "ordered_index"
      get "recieved_index"
    end
    member do
    put "decline"
    put "recieved"
    end
  end

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
  resources :advertisements do
    collection do
      get "registration_index"
    end
  end
  
end
