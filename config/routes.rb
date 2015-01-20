Rails.application.routes.draw do
  resources :topics

  devise_for :users

  root to: 'welcome#index'

  post :incoming, to: 'incoming#create'

 end
