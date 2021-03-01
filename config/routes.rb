Rails.application.routes.draw do
  root to: "meals#index"
  resources :meals, only: [:index]
end
