require 'rails_helper'

describe 'As a user' do
  context 'when I visit main page' do
    scenario 'I can see recent activity of users I follow' do
      user = build(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      events = File.open('./spec/fixtures/events.json')
      stub_request(:get, "https://api.github.com/users/annaroyer/received_events")
         .to_return(status: 200, body: events, headers: {})

      visit users_path

      expect(page).to have_content('memcmahon started following corneliusellen 3 hours ago')
      expect(page).to have_content('memcmahon started following you')
      expect(page).to have_content('lnchambers created a repository lnchambers/potterspec')
    end
  end
end
