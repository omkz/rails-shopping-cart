Rails.application.routes.draw do
  resources :products, only: [:index]
  resource :cart, only: [:show]
  resources :order_items, only: [:create, :update, :destroy]
  resource :orders, only: [:update, :show]
  root to: "products#index"

  get '/checkout', to: "orders#checkout"
end
