Rails.application.routes.draw do
  devise_for :users
  resources :repos do
    resources :comments
    resources :likes
  end

  get "/", to: "repos#index", as: "root"
  get "/repos/:id", to: "repos#show", as: "show_repo"

  get "/about", to: "pages#about", as: "about"

  get "/profile/:id", to: "profiles#index", as: "user"
  put "/profile/:id", to: "profiles#edit"
  patch "/profile/:id", to: "profiles#edit"
  post "/profile/:id", to: "profiles#update"
  get "/profile/:id/edit", to: "profiles#edit", as: "edit_profile"
end
