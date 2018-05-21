Rails.application.routes.draw do
  get 'tools/index'
  get 'tools/show'
  get 'tools/new'
  get 'tools/create'
  get 'tools/edit'
  get 'tools/update'
  get 'tools/destroy'
  get 'users/new'
  get 'users/create'
  get 'users/destroy'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
