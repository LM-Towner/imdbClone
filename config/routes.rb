Rails.application.routes.draw do

  get 'movies/index'

  get 'movies/show'

  get '/users/show'

  devise_for :users, controllers: { sessions: 'users/sessions' }

  root to: 'movies#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
