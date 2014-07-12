class FixOwnerColumnName < ActiveRecord::Migration
  def change
    rename_column :loans, :owner_id, :lender_id
  end
end
