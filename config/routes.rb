FriendBC::Application.routes.draw do
  resources :comments

  resources :posts

  get 'auth/facebook'
  
  resources :users

  resource :session, :only => [:new, :create, :destroy]

  get "pages/home"

  root :to => 'Pages#home'
end
