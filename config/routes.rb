Rails.application.routes.draw do
  resources 'events'
  root 'static_pages#home'
  resources 'users'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
end
