class AddReferenceToReview < ActiveRecord::Migration[7.0]
  def change
    add_reference :reviews, :food, null: false, foreign_key: true
    add_reference :reviews, :store_customer, null: false, foreign_key: true
  end
end
