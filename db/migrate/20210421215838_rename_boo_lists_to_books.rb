class RenameBooListsToBooks < ActiveRecord::Migration[5.2]
  def change
    rename_table :boo, :books
  end
end
