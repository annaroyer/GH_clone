require 'rails_helper'

describe 'As a user' do
  context 'when I visit my profile' do
    before(:each) do
      @user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
      visit user_path(@user)
    end
    scenario 'I can see my name' do
      expect(page).to have_content(@user.name)
    end
  end
end
