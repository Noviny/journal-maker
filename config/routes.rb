Rails.application.routes.draw do

  root :to => 'books#index'

  get 'articles/superexperiment' => 'articles#superexperiment'

  get '/books/:id/format' => 'books#format'
  get '/users/books' => 'users#books'
  get '/articles/supercreate' => 'articles#supercreate'
  post '/articles/supercreate' => 'articles#supercreating'
  get '/articles/supercheck' =>  'articles#supercheck'
  get '/book/:id/articles' => 'books#articles'
  post '/books/:book_id/:chapter_id/:articles_id' => 'chapters#remove'

  resources :articles, :authors, :sources, :users
  resources :books do
    resources :chapters
  end



  get '/login' => 'session#new'
  post 'login' => 'session#create'
  delete '/login' => 'session#destroy'
end
