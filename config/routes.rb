Blocipedia::Application.routes.draw do
  get "charges/create"
  get "charges_controller/create"
  resources :wikis
  devise_for :users
  resources :charges, only: [:new, :create]
  get 'about' => 'welcome#about'

  root to: 'welcome#index'
  
end
