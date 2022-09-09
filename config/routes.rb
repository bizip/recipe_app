Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  get 'inventory_foods/:id/new', to: 'inventory_foods#new'
  delete 'inventory_foods/:id/destroy/:food_id', to: 'inventory_foods#destroy'
  post 'inventory_foods/:id/create', to: 'inventory_foods#create'
  root "foods#index"
  resources :inventories, only: [:index, :show, :new, :create, :destroy]
  resources :foods, only:[:index,:new,:create,:destroy]
  resources :user, only: [:index] do
  end
end
