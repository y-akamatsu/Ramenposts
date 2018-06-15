Rails.application.routes.draw do
  get 'ramenposts/create'

  get 'ramenposts/destroy'

  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'

  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :new, :create, :edit, :destroy]
  resources :ramenposts, only: [:create, :edit, :destroy]
end
