class CreateShoppingAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :shopping_addresses do |t|
      t.string      :zip_code,            null: false
      t.integer     :prefectures_id,      null: false
      t.string      :city,                null: false
      t.string      :address,             null: false
      t.string      :building_name
      t.string      :phone_number,        null: false
      t.references  :purchase_management, null: false, foreign_key: true
      t.timestamps
    end
  end
end
