class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :timeoutable, :validatable, :omniauthable

  def self.from_omniauth(auth)
    find_or_create_by(provider: auth.provider, uid: auth.uid) do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.username = auth["nickname"]
      user.email = dummy_email(auth)
      user.encrypted_password = Devise.friendly_token[0, 20]
    end
  end

  private

  def self.dummy_email(auth)
    "#{auth.uid}@yugenjigo.com"
  end
end
