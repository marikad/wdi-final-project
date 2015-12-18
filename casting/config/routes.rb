Rails.application.routes.draw do
  root "users#index"
  resources :jobs
  devise_for :users
  resources :users do
    member do
      put "like", to: "users#upvote"
      put "dislike", to: "users#downvote"
    end
  end
  resources :users, only: [:index, :show]


end
