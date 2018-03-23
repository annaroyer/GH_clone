require 'rails_helper'

describe GithubUser do
  context 'instance methods' do
    before(:each) do
      user = build(:user)
      @github_user = GithubUser.new(user)
    end

    describe '#recent_commits' do
      it "returns the count of a user's recent commits" do
        VCR.use_cassette('my_events') do
          expect(@github_user.recent_commits).to eq(63)
        end
      end
    end

      describe '#recent_repo_commits' do
        it 'returns commit counts grouped by repository' do
          VCR.use_cassette('commits') do
            expect(@github_user.recent_repo_commits.count).to eq(3)
            expect(@github_user.recent_repo_commits.keys.first).to eq('annaroyer/api_curious')
            expect(@github_user.recent_repo_commits.values.first).to eq(67)
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

    describe '#organizations' do
      it 'returns a collection of organizations a user is in' do
        VCR.use_cassette('organizations') do
          allow(@github_user).to receive(:nickname).and_return('ultrasaurus')
          expect(@github_user.organizations.count).to eq(7)
        end
      end
    end
  end
end
