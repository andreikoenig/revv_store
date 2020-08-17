class OrdersController < ApplicationController
  def create
    product = Product.find(params['product_id'])

    Stripe.api_key = ENV['STRIPE_SECRET_KEY']

    @session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        price_data: {
          currency: 'usd',
          product_data: {
            name: product.name,
            description: product.description
          },
          unit_amount: product.price,
        },
        quantity: 1,
      }],
      mode: 'payment',
      success_url: orders_success_url + '?session_id={CHECKOUT_SESSION_ID}',
      cancel_url: orders_cancel_url
    )

    Order.create(session_id: @session.id, product_id: product.id, status: "Incomplete")
  end

  def success
    session = Stripe::Checkout::Session.retrieve(params['session_id'])
    @order = Order.find_by(session_id: session.id)
    customer = Stripe::Customer.retrieve(session.customer)

    @order.update(payment_intent_id: session.payment_intent, customer_email: customer.email, status: "Complete")
  end

  def cancel
    redirect_to root_path
  end
end
