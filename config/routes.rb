Rails.application.routes.draw do
  root 'products#index'

  resources :orders, only: [:create]
  get 'orders/success'
  get 'orders/cancel'
end
