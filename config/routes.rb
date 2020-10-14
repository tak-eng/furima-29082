Rails.application.routes.draw do
  root 'items#index'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  resources :users, only: [:edit, :update]
  resources :items do
    resources :orders, only:[:index, :create]
  end

end
