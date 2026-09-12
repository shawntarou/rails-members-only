Rails.application.routes.draw do
  resources :posts
  # Defines devise signup links, login links, edit profile links, etc.
  devise_for :users
  # Defines the root path route ("/")
  root "posts#index"
end
