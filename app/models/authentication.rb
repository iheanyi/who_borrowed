class Authentication < ActiveRecord::Base
  belongs_to :user

  def self.from_omniauth(user, auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |authentication|

      auth = user.authentications.build(provider: auth.provider, uid: auth.uid, name: auth.info.name, oauth_token: auth.credentials.token, oauth_expires_at: Time.at(auth.credentials.expires_at))
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
end
