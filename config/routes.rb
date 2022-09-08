Rails.application.routes.draw do
  devise_for :users

  root "users#index"
  resources :users do
    resources :recipes
  end
  resources :foods
end
