Rails.application.routes.draw do
  resources :posts
  # Defines devise signup links, login links, edit profile links, etc.
  devise_for :users, controllers: {
    sessions: "users/sessions"
  }
  # Defines the root path route ("/")
  root "posts#index"
end
