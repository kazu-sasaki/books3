Rails.application.routes.draw do
  devise_for :users
  resources :books
  resources :users
  root to: 'users#index'
  get '/about' => 'users#about'

end
