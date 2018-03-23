require 'rails_helper'

describe GithubUser do
  context 'instance methods' do
    before(:each) do
      user = build(:user)
      @github_user = GithubUser.new(user)
    end

    VCR.use_cassette('events') do
      describe '#push_events' do
        it 'returns a collection of push events for a user' do
          events = @github_user.push_events
          expect(events.count).to eq(8)
          expect(events.first.repo_name).to eq('annaroyer/checks-for-understanding')
        end
      end

      describe '#recent_commits' do
        it "returns the count of a user's recent commits" do
          expect(@github_user.recent_commits).to eq(46)
        end
      end

      describe '#recent_repo_commits' do
        it 'returns commit counts grouped by repository' do
          expect(@github_user.recent_repo_commits.count).to eq(4)
          expect(@github_user.recent_repo_commits.keys.first).to eq('annaroyer/checks-for-understanding')
          expect(@github_user.recent_repo_commits.values.first).to eq(1)
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

    describe '#activity_events' do
      it 'returns a collection of events a user receives' do
        VCR.use_cassette('activity_feed') do
          expect(@github_user.activity_events.count).to eq(30)
          expect(@github_user.activity_events.first.summary).to eq('lnchambers added memcmahon to lnchambers/potterspec')
        end
      end
    end
  end
end
