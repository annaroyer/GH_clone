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
      repo_count: auth[:extra][:raw_info][:public_repos] + auth[:extra][:raw_info][:total_private_repos],
      follower_count: auth[:extra][:raw_info][:followers],
      following_count: auth[:extra][:raw_info][:following],
      token: auth[:credentials][:token]
    )
    user
  end
end
