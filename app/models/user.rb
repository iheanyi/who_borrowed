class User < ActiveRecord::Base

  has_many :items
  has_many :authentications

  before_save { self.email = email.downcase }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :username, presence: true, uniqueness: { case_sensitive: false }
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  has_secure_password


  validates :password, presence: true, length: { minimum: 6 }

  def facebook
    fb_auth = authentications.find_by(provider: "facebook")
    @facebook ||= Koala::Facebook::API.new(fb_auth.oauth_token)
  end

  def facebook_friends
    self.facebook.get_connection("me", "friends")
    #@facebook_friends = user_fb.get_connection("me", "friends")
end
