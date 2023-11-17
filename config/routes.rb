Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :users do
    resource :relationships, only: [:create, :destroy]
  end
    resources :items do
    resources :orders, only: [:index, :create]
    resource  :likes,  only: [:create, :destroy]
  end

end
