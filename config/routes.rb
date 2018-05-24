Rails.application.routes.draw do
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'pages#homepage'

  get 'my_tools', to: 'tools#mine'

  resources :tools do
    resources :bookings, only: [:new, :create]
    resources :reviews, only: [ :new, :create ]
  end
  resources :bookings, only: [:show]
  # resources :reviews, only: [ :destroy ]


  get 'dashboard', to: 'pages#dashboard'

end
