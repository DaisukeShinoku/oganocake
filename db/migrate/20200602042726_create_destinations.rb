class CreateDestinations < ActiveRecord::Migration[5.2]
  def change
    create_table :destinations do |t|

    # ここから下を追加
      t.integer :member_id, null: false
      t.string :postal_code, null: false
      t.string :address, null: false
      t.string :receiver, null: false
    # ここから上を追加

      t.timestamps
    end
    # ここから下をONIKIが追加
    add_index :destinations, :member_id
    # ここから上をONIKIが追加
  end
end
