# config/routes.rb
Rails.application.routes.draw do
  devise_for :users
  root to: "prototypes#index"
  resources :prototypes do
    resources :comments, only: [:create, :destroy]
  end
  resources :users, only: :show
end
