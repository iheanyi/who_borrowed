 class User < ActiveRecord::Base

  #has_many :owned_items, class_name: "Item", foreign_key: "owner_id"
  #has_many :borrowed_items, class_name: "Item", foreign_key: "borrower_id"

  has_many :items
  has_many :loans, :foreign_key => "lender_id"
  has_many :borrowers, :through => :loans

  has_many :authentications, :dependent => :destroy

  before_save { self.email = email.downcase }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :username, presence: true, uniqueness: { case_sensitive: false }
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  has_secure_password


  validates :password, presence: true, length: { minimum: 6 }

  def facebook
    fb_auth = authentications.find_by(provider: "facebook")

    #if fb_auth.expires_at < Time.now

    @facebook ||= Koala::Facebook::API.new(fb_auth.oauth_token)
  end

  def facebook_friends
    self.facebook.get_connection("me", "friends")
    #@facebook_friends = user_fb.get_connection("me", "friends")
  end

  def add_facebook_friends
    friends = self.facebook_friends

    friends.each do |friend|
     # puts friend
    end
  end

  def get_facebook_picture
    self.facebook.get_picture("me", :type => "normal")
  end

  def get_facebook_object_attribute(user, attribute)
    self.facebook.get_object(user)
  end
end
