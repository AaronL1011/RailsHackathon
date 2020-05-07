Rails.application.routes.draw do
  devise_for :users

  get "/", to: "repos#index", as: "root"
  post "/", to: "repos#create"
  get "/repos/new", to: "repos#new", as: "new_repo"
  get "/repos/:id", to: "repos#show", as: "repo"
  put "/repos/:id", to: "repos#update"
  patch "/repos/:id", to: "repos#update"
  delete "/repos/:id", to: "repos#destroy"

  get "/about", to: "pages#about", as: "about"

  get "/comments", to: "comments#index", as: "comments_root"
  post "/comments", to: "comments#create"
  get "/comments/new", to: "comments#new", as: "new_comment"
  get "/comments/:id", to: "comments#show", as: "comment"
  put "/comments/:id", to: "comments#update"
  patch "/comments/:id", to: "comments#update"
  delete "/comments/:id", to: "comments#destroy"

  get "/profile/:id", to: "profiles#index", as: "user"
  put "/profile/:id", to: "profiles#edit"
  patch "/profile/:id", to: "profiles#edit"
  post "/profile/:id", to: "profiles#update"
  get "/profile/:id/edit", to: "profiles#edit", as: "edit_profile"
end
