Rails.application.routes.draw do
  devise_for :users

  get "/", to: "repos#index", as: "root"
  post "/", to: "repos#create"
  get "/repos/new", to: "repos#new", as: "new_repo"
  get "/repos/:id", to: "repos#show", as: "repo"
  put "/repos/:id", to: "repos#update"
  patch "/repos/:id", to: "repos#update"
  delete "/repos/:id", to: "repos#destroy"

  get "/comments", to: "comments#index", as: "root"
  post "/comments", to: "comments#create"
  get "/comments/new", to: "comments#new", as: "new_comment"
  get "/comments/:id", to: "comments#show", as: "comment"
  put "/comments/:id", to: "comments#update"
  patch "/comments/:id", to: "comments#update"
  delete "/comments/:id", to: "comments#destroy"



end
