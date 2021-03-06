class CreateFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :foods do |t|
      t.string :name, null: false, default: ''
      t.decimal :price, null: false, default: 0.00
      t.string :category, null: false, default: ''
      t.string :description, null: false, default: ''
      t.integer :like, null: false, default: 0
      t.decimal :discount, null: false, default: 0.00
      t.boolean :is_available, null: false, default: true
      t.string :picture
      t.string :picture_id
      t.timestamps
    end
  end
end
