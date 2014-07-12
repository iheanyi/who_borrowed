class CreateFacebookFriends < ActiveRecord::Migration
  def change
    create_table :facebook_friends do |t|
      t.references :user_id, index: true
      t.string :name
      t.string :facebook_id

      t.timestamps
    end
  end
end
