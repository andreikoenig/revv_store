class AddCustomerEmailToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :customer_email, :string
  end
end
