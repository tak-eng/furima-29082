Rails.application.routes.draw do
  root 'items#index'
  devise_for :users, controllers: {
    registrations: 'users/registrations', omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'names', to: 'users/registrations#new_name'
    post 'names', to: 'users/registrations#create_name'
  end
  resources :users, only: [:edit, :update]
  resources :items do
    resources :orders, only:[:index, :create]
  end

end
