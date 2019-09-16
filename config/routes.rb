Rails.application.routes.draw do
  get 'users/:id/followers' => "users#followers", as: "followers"
  get 'users/:id/followings' => "users#followings", as: "followings"
  devise_for :users
  root 'tops#top'
  get "home/about" => "tops#about", as: "about"
  get "books/:id/likes" => "favorites#index", as: "favorites"
  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
  resources :users, only: [:edit, :update, :show, :index]
  resources :users do
    resource :relationships, only: [:create, :destroy]
      get :following, on: :member
      get :followers, on: :member
  end

  # For details on the DSL available within this file, see http://guides.ruyonrails.org/routing.html
end
