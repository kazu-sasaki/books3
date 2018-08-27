Rails.application.routes.draw do
  devise_for :users
  resources :blogs
  resources :users
  root to: 'user#index'
  get '/about' => 'user#about'
  
end
