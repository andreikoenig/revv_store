class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.belongs_to :product
      t.string :session_id, index: { unique: true }
      t.string :status

      t.timestamps
    end
  end
end
