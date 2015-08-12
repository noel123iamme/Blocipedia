Rails.application.routes.draw do
  devise_for :users
  resources :users

  resources :wikis
  
  resources :charges, only: [:new, :create]

  get 'about' => 'welcome#about'
  get 'downgrade' => 'users#downgrade'

  root to: 'welcome#index'
end
