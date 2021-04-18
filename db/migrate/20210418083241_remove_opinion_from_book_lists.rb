class RemoveOpinionFromBookLists < ActiveRecord::Migration[5.2]
  def change
    remove_column :book_lists, :opinion, :text
  end
end
