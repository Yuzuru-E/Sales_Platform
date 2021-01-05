class CreateAdvertisements < ActiveRecord::Migration[6.0]
  def change
    create_table :advertisements do |t|
      t.references :client, null: false,  foreign_key: true
      t.string :title, null: false
      t.date :start_on, null: false
      t.date :end_on, null: false
      t.text :banner_image, null: false
      t.text :banner_url, null: false
      t.references :industry, defalt: 1
      t.timestamps
    end
  end
end
