Rails.application.routes.draw do
  devise_for :users
  root 'tops#top'
  get "home/about" => "tops#about", as: "about"
  get "books/:id/likes" => "favorites#index", as: "favorites"
  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
  resources :users, only: [:edit, :update, :show, :index]

  # For details on the DSL available within this file, see http://guides.ruyonrails.org/routing.html
end
