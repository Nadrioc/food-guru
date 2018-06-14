Rails.application.routes.draw do
  get 'dashboard/show'
  devise_for :users
  root to: 'pages#home'
  resources :lessons do
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, only: [:show, :destroy, :edit, :update]
  resources :users, only: [:show]

  get '/dashboard', to: "dashboard#show"
end
