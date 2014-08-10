 class User < ActiveRecord::Base

  #has_many :owned_items, class_name: "Item", foreign_key: "owner_id"
  #has_many :borrowed_items, class_name: "Item", foreign_key: "borrower_id"

  has_many :items
  has_many :loans, :foreign_key => "lender_id"
  has_many :borrowers, :through => :loans

  has_many :authentications, :dependent => :destroy

  before_save { self.email = email.downcase }
  before_create :create_remember_token
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_USERNAME_REGEX = /\A[\w+\-.]+$\z/i

  validates :username, presence: true, uniqueness: { case_sensitive: false },
    format: { with: VALID_USERNAME_REGEX}
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: VALID_EMAIL_REGEX }
  has_secure_password


  validates :password, presence: true, length: { minimum: 6 }
  accepts_nested_attributes_for :loans


  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end


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

  def gravatar_url
    gravatar_id = Digest::MD5::hexdigest(self.email).downcase
    "http://gravatar.com/avatar/#{gravatar_id}.png?s=48"
  end

  def get_facebook_object_attribute(user, attribute)
    self.facebook.get_object(user)
  end

  private

    def create_remember_token
      self.remember_token = User.digest(User.new_remember_token)
    end
end
