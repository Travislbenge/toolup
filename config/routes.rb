Rails.application.routes.draw do
  resources :users, only: [:new, :create, :destroy] do
    resources :tools
  end
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
