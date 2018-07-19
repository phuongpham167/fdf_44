Rails.application.routes.draw do
  devise_for :users,
    controllers:{omniauth_callbacks: "users/omniauth_callbacks"}
  get "/contact", to: "static_pages#contact"

  namespace :admin do
    resources :users, :categories, :products, :orders, :images, :product_temps
  end

  root "static_pages#home"
end
