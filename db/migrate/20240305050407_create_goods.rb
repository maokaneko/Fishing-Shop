class CreateGoods < ActiveRecord::Migration[7.0]
  def change
    create_table :goods do |t|
      t.integer :goods_id
      t.string :title
      t.text :description
      t.string :image_url
      t.integer :price
      t.datetime :date
      t.string :maker
      t.string :category

      t.timestamps
    end
  end
end
