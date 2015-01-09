Blocipedia::Application.routes.draw do
  
  resources :collaborators, only: [:create, :destroy]
  resources :wikis
  devise_for :users
  resources :charges, only: [:new, :create, :destroy]
  get 'about' => 'welcome#about'

  root to: 'welcome#index'
  
end
