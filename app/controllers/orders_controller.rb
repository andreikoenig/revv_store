class OrdersController < ApplicationController
  def create
    @product = Product.find(params['product_id'])
  end

  def success
  end

  def cancel
  end
end
