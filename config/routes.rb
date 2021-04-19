Rails.application.routes.draw do
  root to: "homes#top"
  get "about" => "homes#show"
  devise_for :users, controllers: {   registrations: 'users/registrations',
                                    sessions: 'users/sessions' }

  resources :book_lists, only: [:new, :create, :index, :show, :destroy, :edit, :update]
  resources :users, only: [:index, :show, :edit, :update]
end
