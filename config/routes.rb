Rails.application.routes.draw do

  resources :movies, only: [:index, :show] do
    resources :comments, only: [:create]
    resources :reviews, only: [:create]
    resources :watchlists, only: [:create, :destroy]
    resources :favorites, only: [:create, :destroy]
  end

  resources :reviews, only: [:destroy, :edit, :update] do
    resources :comments, only: [:create]
  end
  resources :comments, only: [:destroy, :edit, :update]

  get 'search', to: "movies#search"

  devise_for :users, controllers: { sessions: 'users/sessions' }
  resources :users, only: [:show]

  root to: 'movies#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
