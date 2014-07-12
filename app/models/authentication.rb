class Authentication < ActiveRecord::Base
  belongs_to :user

  def self.from_omniauth(user, auth)

    oauth = Koala::Facebook::OAuth.new(ENV["FACEBOOK_APP_ID"], ENV["FACEBOOK_SECRET"])
    new_access_info = oauth.exchange_access_token_info auth.credentials.token
    new_access_token = new_access_info["access_token"]
    new_access_expires_at = DateTime.now + new_access_info["expires"].to_i.seconds

    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |authentication|

      auth = user.authentications.build(provider: auth.provider, uid: auth.uid, name: auth.info.name, oauth_token: new_access_token, oauth_expires_at:new_access_expires_at)
      auth.save!
      #authentication.user = user
      #authentication.provider = auth.provider
      #authentication.uid = auth.uid
      #authentication.name = auth.info.name
      #authentication.oauth_token = auth.credentials.token
      #authentication.oauth_expires_at = Time.at(auth.credentials.expires_at)
      #authentication.save!
    end
  end

  def update_token(auth_hash)
    self.token = auth_hash["credentials"]["token"]
    self.save
  end
end
