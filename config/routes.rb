Rails.application.routes.draw do
  root 'pages#home'
  
  get 'my_passwords', to: 'passwords#my_passwords'
  get 'search_password', to: 'passwords#search'
  devise_for :users, :controllers => { :registrations => 'registrations'}
  match 'users/:id' => 'users#destroy', :via => :delete, :as => :admin_destroy_user
  resources :users
  resources :passwords
end
