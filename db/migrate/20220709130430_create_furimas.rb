class CreateFurimas < ActiveRecord::Migration[6.0]
  def change
    create_table :furimas do |t|
      t.string :title,          null: false
      t.string :content,        null: false
      t.integer :genre_id,      null: false
      t.integer :condition_id,  null: false
      t.integer :fee_id,        null: false
      t.integer :prefecture_id, null: false
      t.integer :days_num_id,   null: false
      t.integer :price,         null: false
      t.references :user,       foreign_key: true
      t.timestamps
    end
  end
end
