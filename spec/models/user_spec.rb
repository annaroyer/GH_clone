require 'rails_helper'

def auth_hash
  {uid: "26782839",
   info: {
     nickname: "annaroyer",
     email: "anna.royer@colorado.edu",
     name: "Anna Royer",
     image: "https://avatars0.githubusercontent.com/u/26782839?v=4"
   },
   credentials: {token: "ABC2875902487509"},
   extra:
    {raw_info:
      {
       location: "Boulder, CO",
       bio: "Student",
       public_repos: 39,
       followers: 4,
       following: 4,
       total_private_repos: 0
      }
    }
  }
end

describe User, type: :model do
  context 'class methods' do
    describe '.update_or_create' do
      it 'creates or updates a user with the auth hash' do
        user = User.update_or_create(auth_hash)

        expect(user.token).to eq(auth_hash[:credentials][:token])
        expect(user.email).to eq(auth_hash[:info][:email])
      end
    end
  end
end
