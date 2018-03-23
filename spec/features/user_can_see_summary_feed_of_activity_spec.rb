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

      expect(page).to have_content('mgmilton created a repository mgmilton/oauth_workshop')
      expect(page).to have_content('slimecog forked slimecog/lesson_plans from turingschool/lesson_plans')
      expect(page).to have_content('memcmahon created a repository memcmahon/rails_engine')
    end
  end
end
