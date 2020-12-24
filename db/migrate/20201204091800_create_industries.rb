class CreateIndustries < ActiveRecord::Migration[6.0]
  def change
    create_table :industries do |t|
      t.string :name, null: false
      t.string :ancestry
      t.timestamps
    end
    add_index :industries, :ancestry
  end
end
