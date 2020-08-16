Rails.application.routes.draw do
  resources :products, only: [:index]

  resources :orders, only: [:create]
  get 'orders/success'
  get 'orders/cancel'

end
