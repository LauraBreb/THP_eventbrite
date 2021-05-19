Rails.application.routes.draw do
  devise_for :users
  resources :events
  root to: "events#index"
  resources :users, only: [:show, :edit, :update]
end
