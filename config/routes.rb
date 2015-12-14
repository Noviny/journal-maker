Rails.application.routes.draw do

  root :to => 'books#index'

  get 'articles/superexperiment' => 'articles#superexperiment'

  get '/users/books' => 'users#books'
  get '/articles/supercreate' => 'articles#supercreate'
  post '/articles/supercreate' => 'articles#supercreating'
  get '/articles/supercheck' =>  'articles#supercheck'
  get '/book/:id/articles' => 'books#articles'

  resources :articles, :books, :authors, :sources
  resources :users, :except => [:edit]


  get '/login' => 'session#new'
  post 'login' => 'session#create'
  delete '/login' => 'session#destroy'
end
