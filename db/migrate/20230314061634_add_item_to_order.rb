class AddItemToOrder < ActiveRecord::Migration[6.0]
  def change
    add_reference :orders, :item, null: false, foreign_key: true
  end
end
