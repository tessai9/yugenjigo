class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :validatable, :omniauthable

  has_many :declares

  # find or create user
  def self.from_omniauth(auth)
    user_data = User.find_or_create_by!(provider: auth[:provider], uid: auth[:uid]) do |user|
      user.provider = auth[:provider]
      user.uid = auth[:uid]
      user.username = auth[:info][:name]
      user.email = dummy_email(auth)
      user.password = Devise.friendly_token[0, 20]
    end

    user_data
  end

  private

  # make dummy email
  def self.dummy_email(auth)
    "#{auth[:uid]}@yugenjigo.work"
  end
end
