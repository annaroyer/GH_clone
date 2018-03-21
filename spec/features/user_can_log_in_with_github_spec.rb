require 'rails_helper'

def stub_omniauth
  OmniAuth.config.test_mode = true

  OmniAuth.config.mock_auth[:github] =
  OmniAuth::AuthHash.new(
    {"uid"=>"26782839",
     "info"=> {
      "nickname"=>"annaroyer",
      "email"=>"anna.royer@colorado.edu",
      "name"=>"Anna Royer",
      "image"=>"https://avatars0.githubusercontent.com/u/26782839?v=4",
      "urls"=>{"GitHub"=>"https://github.com/annaroyer", "Blog"=>""}
    },
    "credentials"=>{"token"=>ENV['ACCESS_TOKEN']},
    "extra"=>
    {
      "raw_info"=>
      {
         "location"=>"Boulder, CO",
         "bio"=>"Student",
         "public_repos"=>39,
         "followers"=>4,
         "following"=>4,
         "total_private_repos"=>0
      }
    }
  })
end

describe 'As a user' do
  context 'When  I log in using github' do
    scenario 'I can see my basic info' do
      json_body = File.open('./spec/fixtures/starred_repos.json')
      stub_request(:get, "https://api.github.com/user/starred")
         .to_return(status: 200, body: json_body, headers: {})
      stub_omniauth
      visit root_path

      click_link 'Sign In with Github'

      user = User.find_by(uid: 26782839)
      github_user = GithubUser.new(user)

      expect(page).to have_link('Log Out')
      expect(current_path).to eq('/annaroyer')

      expect(page).to have_content('Anna Royer')
      expect(page).to have_content('annaroyer')
      expect(page).to have_link('anna.royer@colorado.edu')
      expect(page).to have_content('Student')
      expect(page).to have_content('Boulder, CO')
      expect(page).to have_xpath("//img[contains(@src, '#{github_user.image}')]")

      expect(page).to have_button('Overview')
      expect(page).to have_button("Repositories #{github_user.repo_count}")
      expect(page).to have_button("Followers #{github_user.follower_count}")
      expect(page).to have_button("Following #{github_user.following_count}")
      expect(page).to have_button("Stars #{github_user.starred_repos.count}")
    end
  end
end
