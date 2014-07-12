class CreateBorrowers < ActiveRecord::Migration
  def change
    create_table :borrowers do |t|
      t.string :name
      t.string :facebook_id
      t.references :user_id, index: true

      t.timestamps
    end
  end
end
