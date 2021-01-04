class CreateMatters < ActiveRecord::Migration[6.0]
  def change
    create_table :matters do |t|
      t.references :client, null: false, foreign_key: true
      t.integer :contractor_id, null: true
      t.string :title, null: false
      t.text :matter_content, null: false
      t.date :start_on, null: false
      t.date :end_on, null: false
      t.string :contract_period, null: false
      t.references :industry, default: 1
      t.string :reward, null: false
      t.integer :number_of_positions, null: false
      t.date :order_date, null: true
      t.timestamps
    end
  end
end
