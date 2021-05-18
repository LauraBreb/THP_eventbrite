Rails.application.routes.draw do
  resources :events
  root to: "events_controller#index"

  get 'static_pages/index'
  get 'static_pages/secret'
  devise_for :users
  
end
