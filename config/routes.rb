Rails.application.routes.draw do
  
  get 'businesses/new'

  get 'password_resets/new'

  get 'password_resets/edit'

  get 'sessions/new'

  root 'static_pages#home'
  get    '/help'    => 'static_pages#help'
  get    '/about'   => 'static_pages#about'
  get    '/signup'  => 'users#new'  
  post   '/signup'    => 'users#create'
  #get    '/business',  to: 'businesses#new'
  #post   '/business',  to: 'businesses#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users do
    member do
      get :following, :followers, :followingz
    end
  end
  
  resources :businesses do
    member do
      get :followerzs
    end
  end
  
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :microposts,          only: [:create, :destroy]
  resources :relationships,       only: [:create, :destroy]
  resources :relationshipzs,       only: [:create, :destroy]
end