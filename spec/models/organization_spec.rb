require 'rails_helper'
\
describe Organization do
  context 'attributes' do
    before(:each) do
      @organization = Organization.new({login: 'github', avatar_url: 'https://github.com/images/error/octocat_happy.gif'})
    end
    it 'has a name' do
      expect(@organization.name).to eq('github')
    end

    it 'has an avatar url' do
      expect(@organization.avatar_url).to eq('https://github.com/images/error/octocat_happy.gif')
    end
  end
end
