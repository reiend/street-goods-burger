class CreateFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :foods do |t|
      t.string :name, null: false, default: ''
      t.bigint :price, null: false, default: 0.00
      t.string :category, null: false, default: ''
      t.string :description, null: false, default: ''
      t.integer :like, null: false, default: 0
      t.bigint :discount, null: false, default: 0.00
      t.boolean :is_available, null: false, default: true

      t.timestamps
    end
  end
end
