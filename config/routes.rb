Rails.application.routes.draw do
  devise_for :users,
    controllers:{omniauth_callbacks: "users/omniauth_callbacks"}
  get "/contact", to: "static_pages#contact"
  get "add_cart/:product_id", to: "carts#add_cart", as: :add_cart
  get "remove_product/:product_id", to: "carts#remove_product", as: :remove_product
  get "update_quantity/:product_id", to: "carts#update_quantity", as: :update_quantity
  get "remove_cart", to: "carts#remove_cart", as: :remove_cart

  namespace :admin do
    resources :users, :categories, :products, :orders, :images, :product_temps
  end

  root "static_pages#home"
  resources :products, only: %i(index show)
  resources :carts, only: :index
  resources :users
end
