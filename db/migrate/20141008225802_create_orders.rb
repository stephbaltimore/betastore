class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.belongs_to :customer, index: true
      t.datetime :placed_at
      t.decimal :total_amount
    end
  end
end
