Rails.application.routes.draw do

  resources :activities
  resources :movies, only: [:index, :show] do
    resources :comments, only: [:create]
    resources :reviews, only: [:create]
    resources :watchlists, only: [:create, :destroy]
    resources :favorites, only: [:create, :destroy]
  end

  resources :reviews, only: [:destroy, :edit, :update] do
    resources :comments, only: [:create]
  end
  resources :comments, only: [:destroy, :edit, :update] do
    resources :comments, only: [:create]
  end

  get 'search', to: "movies#search"

  devise_for :users, controllers: { sessions: 'users/sessions' }
  resources :users, only: [:show]
  # get 'users', :to => 'users#show', :as => :user_root

  root to: 'movies#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
