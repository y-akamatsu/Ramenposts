Rails.application.routes.draw do
  get 'evaluations/create'

  get 'evaluations/destroy'

  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'about', to: 'toppages#about'
  get 'signup', to: 'users#new'
  get 'rankings/like', to: 'rankings#like'
  get 'rankings/ramenpost', to: 'rankings#ramenpost'
  
  resources :users, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    member do
      get :followings
      get :followers
      get :likes
      get :evaluates
    end
    collection do
      get :search
    end
  end
 
  resources :ramenposts, only: [:create, :edit, :destroy]
  resources :relationships, only: [:create, :destroy]
  resources :likes, only: [:create, :destroy]
  resources :evaluations, only: [:create, :destroy]
end
