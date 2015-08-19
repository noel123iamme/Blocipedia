Rails.application.routes.draw do
  get 'collaborators/create'

  get 'collaborators/destroy'

  devise_for :users
  resources :users

  resources :wikis
  resources :collaborators, only: [:create, :destroy]
  
  resources :charges, only: [:new, :create]

  get 'about' => 'welcome#about'
  get 'downgrade' => 'users#downgrade'

  root to: 'welcome#index'
end
