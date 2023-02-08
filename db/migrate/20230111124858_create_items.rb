class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.integer :genre, null: false
      t.integer :weekday, null: false
       t.integer :year, null: false
      t.text :name, null: false
      t.text :introduction, null: false
      t.text :url, null: false

      t.timestamps
    end
  end
end
