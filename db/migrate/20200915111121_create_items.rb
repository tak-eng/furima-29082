class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string       :name,                null: false
      t.text         :text,                null: false
      t.string       :price,               null: false
      t.references   :user,                null: false, foreign_key: true
      t.integer      :category_id,         null: false
      t.integer      :item_condition_id,   null: false
      t.integer      :shipping_costs_id,   null: false
      t.integer      :shipping_address_id, null: false
      t.integer      :derivery_date_id,    null: false
      t.timestamps
    end
  end
end