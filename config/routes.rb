Rails.application.routes.draw do
  resources :products

  resources :orders
  get 'orders/success'
  get 'orders/cancel'

end
