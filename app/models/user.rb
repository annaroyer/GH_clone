class User < ApplicationRecord
  def self.update_or_create(auth)
    user = User.find_or_create_by(uid: auth[:uid])
    user.update(
      uid: auth[:uid],
      email: auth[:info][:email],
      nickname: auth[:info][:nickname],
      name: auth[:info][:name],
      image: auth[:info][:image],
      location: auth[:extra][:raw_info][:location],
      bio: auth[:extra][:raw_info][:bio],
      repositories: auth[:extra][:raw_info][:public_repos],
      followers: auth[:extra][:raw_info][:followers],
      following: auth[:extra][:raw_info][:following],
      created_at: auth[:extra][:raw_info][:created_at],
      updated_at: auth[:extra][:raw_info][:updated_at],
      token: auth[:credentials][:token]
    )
    user
  end
end
