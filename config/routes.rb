Rails.application.routes.draw do

  root :to => 'books#index'

  get 'articles/superexperiment' => 'articles#superexperiment'

  get '/book/:id/format' => 'books#format'
  get '/users/books' => 'users#books'
  get '/articles/supercreate' => 'articles#supercreate'
  post '/articles/supercreate' => 'articles#supercreating'
  get '/articles/supercheck' =>  'articles#supercheck'
  get '/book/:id/articles' => 'books#articles'

  resources :articles, :authors, :sources, :users
  resources :books do
    resources :chapters
  end



  get '/login' => 'session#new'
  post 'login' => 'session#create'
  delete '/login' => 'session#destroy'
end
