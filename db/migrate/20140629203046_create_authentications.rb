class CreateAuthentications < ActiveRecord::Migration
  def change

    drop_table :authentications
    create_table :authentications do |t|
      t.integer :user_id
      t.string :provider
      t.string :uid
      t.string :name
      t.string :oauth_token
      t.datetime :oauth_expires_at

      t.timestamps
    end
  end
end
