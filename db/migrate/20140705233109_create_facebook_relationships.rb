class CreateFacebookRelationships < ActiveRecord::Migration
  def change
    create_table :facebook_relationships do |t|
      t.references :user_id, index: true
      t.references :facebook_friend_id, index: true

      t.timestamps
    end
  end
end
