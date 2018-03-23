require 'request'

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
    "credentials"=>{"token"=>12345},
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
      events = File.open('./spec/fixtures/my_events.json')
      stub_request(:get, "https://api.github.com/users/annaroyer/events")
        .to_return(status: 200, body: events, headers: {})

      stub_basic_requests
      stub_omniauth
      visit root_path

      click_link 'Sign In with Github'

      expect(page).to have_link('Log Out')

      expect(page).to have_content('Anna Royer')
      expect(page).to have_content('annaroyer')
      expect(page).to have_link('anna.royer@colorado.edu')
      expect(page).to have_content('Student')
      expect(page).to have_content('Boulder, CO')
      expect(page).to have_xpath("//img[contains(@src, 'https://avatars0.githubusercontent.com/u/26782839?v=4')]")

      expect(page).to have_button('Overview')
      expect(page).to have_button("Repositories 39")
      expect(page).to have_button("Followers 4")
      expect(page).to have_button("Following 4")
      expect(page).to have_button("Stars 1")

      expect(page).to have_content("Created 49 commits in 3 repositories")
      expect(page).to have_content('annaroyer/api_curious 21 commits')
      expect(page).to have_content('annaroyer/dog-party-BE2 1 commit')
      expect(page).to have_content('annaroyer/rales_engine 27 commits')
    end
  end
end
