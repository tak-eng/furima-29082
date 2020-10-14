class CreateNames < ActiveRecord::Migration[6.0]
  def change
    create_table :names do |t|
      t.string :firstname_zen,      null: false
      t.string :lastname_zen,       null: false
      t.string :firstname_kana,     null: false
      t.string :lastname_kana,      null: false
      t.date   :birthday,           null: false
      t.references :user,         null: false, foreign_key: true
      t.timestamps
    end
  end
end
