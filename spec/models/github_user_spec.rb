require 'rails_helper'

describe GithubUser do
  context 'instance methods' do
    before(:each) do
      user = build(:user)
      @github_user = GithubUser.new(user)
    end

    describe '#push_events' do
      it 'returns a collection of push events for a user' do
        VCR.use_cassette('events') do
          events = @github_user.push_events
          expect(events.count).to eq(11)
          expect(events.first.repo_name).to eq('annaroyer/api_curious')
        end
      end
    end

    describe '#starred_repos' do
      it "returns a collection of a user's starred repos" do
        VCR.use_cassette('starred_repos') do
          expect(@github_user.starred_repos.count).to eq(1)
        end
      end
    end
  end
end
