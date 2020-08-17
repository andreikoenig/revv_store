# README

App flow:
1. View list of products for purchase at root url
2. Click to buy a product using Stripe Checkout flow
3. Stripe session is created, and in db initial order record is created with session id
4. Finish checkout process using a credit card (42424242....)
5. Order is updated with customer email, payment_intent_id, and status('Complete')
6. PaymentIntent is updated in stripe with metadata containing order id and product name
7. Confirmation page is shown with the summary of the order.

Notes: went with PaymentIntent instead of Charge ID based on this: https://stripe.com/docs/payments/payment-intents/migration/charges, and the session from Stripe Checkout flow returns payment_intent_id.


To run the repo locally:

1. Clone repo
2. `bundle install`
3. `rails db:migrate`
4. `rails db:seed`
5. `export STRIPE_PUBLISHABLE_KEY=from_stripe_dashboard`
6. `export STRIPE_SECRET_KEY=from_stripe_dashboard`
7. `rails s`




