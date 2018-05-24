Rails.application.routes.draw do

  root to: 'pages#homepage'
  get 'my_tools', to: 'tools#mine'
  resources :tools do
    resources :bookings, only: [:new, :create]
    resources :reviews, only: [ :index, :new, :create ]
  end
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :bookings, only: [:show]
   resources :reviews, only: [ :show, :edit, :update, :destroy ]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
