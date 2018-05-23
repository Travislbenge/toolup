Rails.application.routes.draw do

  root to: 'pages#homepage'
  get 'my_tools', to: 'tools#mine'
  resources :tools
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :bookings

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
