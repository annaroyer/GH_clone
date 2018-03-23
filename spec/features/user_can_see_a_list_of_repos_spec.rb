require 'request'

describe 'As a user' do
  context 'when I visit my profile page and click repositories' do
    scenario 'I can see a list of my repositories' do
      user = build(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      stub_basic_requests  

      visit users_path

      expect(page).to have_link('api_curious')
      expect(page).to have_link('gif_generator')
      expect(page).to have_link('black_thursday')
    end
  end
end
