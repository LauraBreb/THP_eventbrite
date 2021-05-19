Rails.application.routes.draw do
  get 'users/show'
  root to: "events#index"
  devise_for :users
  resources :events
  resources :users, only: [:edit, :update, :show]
end
