class CreateBookLists < ActiveRecord::Migration[5.2]
  def change
    create_table :book_lists do |t|
      t.text :title
      t.text :opinion
      t.integer :user_id

      t.timestamps
    end
  end
end
