class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.references :order
      t.references :product

      t.string     :name
      t.decimal    :price
      t.integer    :quantity
    end
  end
end
