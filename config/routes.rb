FriendBC::Application.routes.draw do
  resources :users

  get "pages/home"

  root :to => 'Pages#home'
end
