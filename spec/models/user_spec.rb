require 'rails_helper'

def auth_hash
    {
    uid: 26782839,
    info: {
      nickname: "annaroyer",
      email: "anna.royer@colorado.edu",
      name: "Anna Royer",
      image: "https://avatars0.githubusercontent.com/u/26782839?v=4",
      urls: {"GitHub"=>"https://github.com/annaroyer", "Blog"=>""}
    },
    credentials: {token: "5f13e5a5356568ef391219247a05758311d4c5bd", "expires"=>false}
  }
end

describe User, type: :model do
  context 'class methods' do
    describe '.update_or_create' do
      it 'creates or updates a user with the auth hash' do
        user = User.update_or_create(auth_hash)

        expect(user.uid).to eq(auth_hash[:uid])
        expect(user.email).to eq(auth_hash[:info][:email])
      end
    end
  end
end
