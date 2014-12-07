class AddOrdersAndLineItems < ActiveRecord::Migration
  def change

    change_table :orders do |t|
      t.string :email
      t.references :cart
    end
    add_index :orders, :cart_id, :unique => true

    change_table :line_items do |t|
      t.string     :name
    end

    
  end
end
