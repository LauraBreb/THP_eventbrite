Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show, :edit, :update]
  resources :events do
    resources :attendances
  end
  root "events#index"
  resources :charges
end
