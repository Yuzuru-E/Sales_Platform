class CreateContractors < ActiveRecord::Migration[6.0]
  def change
    create_table :contractors do |t|
      t.references :gender, null: false, default: 0
      t.integer :receive_order_count
      t.string :suggested_price
      t.references :operating, null: false, default: 0
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
