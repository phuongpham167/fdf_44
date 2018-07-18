Rails.application.routes.draw do
  devise_for :users
  get "/contact", to: "static_pages#contact"

  root "static_pages#home"
end
