  require 'sidekiq/web' 

Rails.application.routes.draw do
  devise_for :users
  
  root 'videos#index'
  resources :videos

  get '/videos/:id/like' => 'videos#like'
  get '/videos/:id/dislike' => 'videos#dislike'



  resources :users

  mount Sidekiq::Web => '/sidekiq'
end
