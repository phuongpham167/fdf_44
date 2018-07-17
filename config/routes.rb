Rails.application.routes.draw do
  get "/contact", to: "static_pages#contact"

  root "static_pages#home"
end
