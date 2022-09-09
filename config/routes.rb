Rails.application.routes.draw do
  devise_for :users

  root "users#index"
  resources :users do
    resources :recipes do
      resources :foods, only: [:create, :new]
    end
  end
  resources :foods
  resources :public_recipes, only: [:index, :show]
end
