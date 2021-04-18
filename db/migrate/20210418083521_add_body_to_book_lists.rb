class AddBodyToBookLists < ActiveRecord::Migration[5.2]
  def change
    add_column :book_lists, :body, :text
  end
end
