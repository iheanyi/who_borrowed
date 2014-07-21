class FixColumnNameBorrower < ActiveRecord::Migration
  def change
    rename_column :borrowers, :user_id_id, :user_id
  end
end
