Rails.application.routes.draw do
  root "users#index"
  resources :jobs
  resources :users, only: [:index, :show]
  devise_for :users
end
