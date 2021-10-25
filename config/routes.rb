Rails.application.routes.draw do
  get 'login' =>  'user_sessions#new', :as => :login
  post 'login' =>  'user_sessions#create'
  delete 'logout' =>  'user_sessions#destroy', :as => :logout

  root 'user_sessions#new'
  resources :tasks
  resources :users, only: %i[new create]
end
