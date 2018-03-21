require 'rails_helper'

describe 'As a user' do
  context 'when I visit my profile' do
    before(:each) do
      user = create(:user)
      @github_user = GithubUser.new(user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@github_user)
      visit user_path(@github_user)
    end

    scenario 'I can see my basic info' do
      expect(page).to have_content(@github_user.name)
      expect(page).to have_content(@github_user.nickname)
      expect(page).to have_link(@github_user.email)
      expect(page).to have_content(@github_user.bio)
      expect(page).to have_content(@github_user.location)
      expect(page).to have_xpath("//img[contains(@src, '#{@github_user.image}')]")
      expect(page).to have_button("Repositories #{@github_user.repo_count}")
      expect(page).to have_button("Repositories #{@github_user.follower_count}")
      expect(page).to have_button("Repositories #{@github_user.following_count}")
      expect(page).to have_button("Repositories #{@github_user.star_count}")
    end
  end
end
