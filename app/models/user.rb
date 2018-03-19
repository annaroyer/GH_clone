class User < ApplicationRecord
  def self.update_or_create(auth)
    user = User.find_or_create_by(uid: auth[:uid])
    user.update(
      uid: auth[:uid],
      email: auth[:info][:email],
      nickname: auth[:info][:nickname],
      name: auth[:info][:name],
      image: auth[:info][:image],
      token: auth[:credentials][:token]
    )
    user
  end
end
