require 'rails_helper'

def stub_basic_requests
  starred_repos = File.open('./spec/fixtures/starred_repos.json')
  stub_request(:get, "https://api.github.com/user/starred")
     .to_return(status: 200, body: starred_repos, headers: {})
  stub_request(:get, "https://api.github.com/users/annaroyer/orgs")
    .to_return(status: 200, body: '[]', headers: {})
end
