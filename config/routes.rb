Rails.application.routes.draw do
  root to: "homes#top"
  devise_for :users
  resources :book_lists, only: [:new, :create, :index, :show, :destroy]
  resources :users, only: [:index, :show, :edit, :update]
end
