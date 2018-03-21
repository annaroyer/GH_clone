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
    "credentials"=>{"token"=>ENV["GITHUB_ACCESS_TOKEN"]},
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

feature 'user logs in' do
  scenario 'using github' do
    stub_omniauth
    visit root_path

    click_link 'Sign In with Github'

    expect(page).to have_content('Anna Royer')
    expect(page).to have_link('Log Out')
  end
end
