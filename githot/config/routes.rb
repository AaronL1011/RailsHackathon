Rails.application.routes.draw do
  devise_for :users
  get "/", to: "repos#index", as: "root"
end
