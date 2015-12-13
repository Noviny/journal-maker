Rails.application.routes.draw do

  root :to => 'books#index'

  get '/users/books' => 'users#books'
  get '/articles/supercreate' => 'articles#supercreate'
  post '/articles/supercreate' => 'articles#supercreating'
  get '/articles/supercheck' =>  'articles#supercheck'


  resources :articles, :books
  resources :users, :except => [:edit]


  get '/login' => 'session#new'
  post 'login' => 'session#create'
  delete '/login' => 'session#destroy'
end
