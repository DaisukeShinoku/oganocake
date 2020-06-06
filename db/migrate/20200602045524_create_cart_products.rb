class CreateCartProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_products do |t|

    # ここから下を追加
      t.integer :member_id, null: false
      t.integer :product_id, null: false
      t.integer :quantity, null: false
    # ここから上を追加

      t.timestamps
    end
    # ここから下をONIKIが追加
    add_index :cart_products, :member_id
    # ここから上をONIKIが追加
  end
end
