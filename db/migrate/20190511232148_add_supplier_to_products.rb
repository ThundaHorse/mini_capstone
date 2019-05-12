class AddSupplierToProducts < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :supplier_id, :products
  end
end
