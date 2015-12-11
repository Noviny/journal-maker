Rails.application.routes.draw do

  root :to => 'books#index'

  resources :articles, :books
  resources :users, :except => [:edit]



  get '/login' => 'session#new'
  post 'login' => 'session#create'
  delete '/login' => 'session#destroy'
end
