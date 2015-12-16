Rails.application.routes.draw do
  root "users#index"
  resources :jobs
  devise_for :users
  resources :users, only: [:index, :show]
end
