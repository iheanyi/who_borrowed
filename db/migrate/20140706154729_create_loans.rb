class CreateLoans < ActiveRecord::Migration
  def change
    create_table :loans do |t|
      t.integer :borrower_id
      t.integer :owner_id
      t.integer :item_id
      t.datetime :loaned_on
      t.datetime :returned_on
      t.datetime :return_by

      t.timestamps
    end
  end
end
