class CreateClients < ActiveRecord::Migration[6.0]
  def change
    create_table :clients do |t|
      t.string :company_name
      t.text :hp_url
      t.string :postal_code
      t.references :prefecture, null: false, default: 0
      t.string :city
      t.string :address
      t.text :building
      t.integer :phone_number
      t.integer :send_order_count
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
