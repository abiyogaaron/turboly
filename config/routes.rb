Rails.application.routes.draw do
  root to: 'tasks#index'
  get 'tasks/index', to: 'tasks#index'

  resources :tasks, only:[:index, :new, :create, :edit, :show]
  #get "/tasks/:id", to: 'tasks#show'
  #post "/tasks/new", to: 'tasks#new'
  post "/task/finished/:id", to: 'tasks#finished', as: :finished_path

  devise_for :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #root routes
  
end
