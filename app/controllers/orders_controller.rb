class OrdersController < ApplicationController
  def create
    @product = Product.find(params['product_id'])

    Stripe.api_key = ENV['STRIPE_SECRET_KEY']
    puts Stripe.api_key

    @session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        price_data: {
          currency: 'usd',
          product_data: {
            name: @product.name,
            description: @product.description
          },
          unit_amount: @product.price,
        },
        quantity: 1,
      }],
      mode: 'payment',
      success_url: orders_success_url + '?session_id={CHECKOUT_SESSION_ID}',
      cancel_url: orders_cancel_url
    )

    puts 'sessionId: ' + @session.id
  end

  def success
    binding.pry
  end

  def cancel
  end
end
