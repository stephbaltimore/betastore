class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :email
      t.references :cart

      t.timestamps
    end
    add_index :orders, :cart_id, :unique => true

    end
  end
end
