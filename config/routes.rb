Rails.application.routes.draw do
  get 'dashboard/show'
  devise_for :users
  root to: 'pages#home'
  resources :lessons do
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, only: [:show, :destroy, :edit, :update]
  resources :users, only: [:show]
  # do
  #   member do
  #     get 'all_lessons', to: "users#all_lessons"
  #   end
  # end

  get '/dashboard', to: "dashboard#show"
end
