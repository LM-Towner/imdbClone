Rails.application.routes.draw do

  get 'movies/index'

  get 'movies/show'


  devise_for :users, controllers: { sessions: 'users/sessions' }
  resources :users, only: [:show]

  root to: 'movies#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
