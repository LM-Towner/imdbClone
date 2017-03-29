Rails.application.routes.draw do

  resources :movies, only: [:index, :show]
  get 'search', to: "movies#search"

  devise_for :users, controllers: { sessions: 'users/sessions' }

  root to: 'movies#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
