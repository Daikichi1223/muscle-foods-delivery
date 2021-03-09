Rails.application.routes.draw do
  devise_for :shops
  devise_for :users
  root to: "meals#index"
  resources :meals, only: [:index, :new, :create, :show] do
    resources :orders, only: [:index, :create]
  end
end
