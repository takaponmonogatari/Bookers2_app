class RenameBookListsToBooks < ActiveRecord::Migration[5.2]
  def change
    rename_table :book_lists, :books
  end
end
