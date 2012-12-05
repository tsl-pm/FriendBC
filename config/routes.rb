FriendBC::Application.routes.draw do
  resources :users

  resource :session, :only => [:new, :create, :destroy]

  get "pages/home"

  root :to => 'Pages#home'
end
