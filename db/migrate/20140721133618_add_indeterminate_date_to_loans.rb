class AddIndeterminateDateToLoans < ActiveRecord::Migration
  def change
    add_column :loans, :return_whenever, :boolean
  end
end
