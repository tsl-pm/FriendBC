FriendBC::Application.routes.draw do
  resources :comments

  resources :posts

  get 'auth/facebook'
  
  resources :users

  resource :session, :only => [:new, :create, :destroy]

  root :to => 'Posts#index'
end
