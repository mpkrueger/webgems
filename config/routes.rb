Rails.application.routes.draw do
  
  resources :topics do
    resources :bookmarks
  end

  devise_for :users

  root to: 'welcome#index'

  post :incoming, to: 'incoming#create'

 end
