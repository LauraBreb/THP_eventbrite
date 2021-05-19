Rails.application.routes.draw do
  resources :events
  root to: "events#index"
  devise_for :users
  resources :users, only: [:edit, :update, :show]
end
