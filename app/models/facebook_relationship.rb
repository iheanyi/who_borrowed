class FacebookRelationship < ActiveRecord::Base
  belongs_to :user_id
  belongs_to :facebook_friend_id
end
