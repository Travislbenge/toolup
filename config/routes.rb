Rails.application.routes.draw do
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'pages#homepage'

  get 'my_tools', to: 'tools#mine'

  resources :tools do
    resources :bookings, only: [:new, :create]
    resources :reviews, only: [ :index, :new, :create ]
  end
  resources :bookings, only: [:show]
<<<<<<< HEAD
   resources :reviews, only: [ :show, :edit, :update, :destroy ]
=======

  get 'dashboard', to: 'pages#dashboard'
>>>>>>> 83cb5968efbfaccfc3dcaec5ee21203ab8e68a75
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
