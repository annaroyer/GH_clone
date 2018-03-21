require 'rails_helper'

describe 'As a user' do
  context 'when I visit my profile page' do
    scenario 'I can see my recent commits' do
      user = create(:user)
      @github_user = GithubUser.new(user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    end
  end
end
