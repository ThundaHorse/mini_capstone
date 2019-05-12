class SupToProducts < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :products, :suppliers
  end
end
