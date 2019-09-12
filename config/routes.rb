Rails.application.routes.draw do
  devise_for :users
  root 'tops#top'
  get "home/about" => "tops#about", as: "about"
  resources :books
  resources :users, only: [:edit, :update, :show, :index]
  # For details on the DSL available within this file, see http://guides.ruyonrails.org/routing.html
end
