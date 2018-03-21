class GithubService < ApplicationController
  attr_reader :conn

  def initialize(access_token)
    @conn = Faraday.new do |faraday|
      faraday.headers[:authorization] = "token #{access_token}"
      faraday.adapter Faraday.default_adapter
    end
  end

  def get_url(url)
    response = @conn.get("https://api.github.com/user/#{url}")
    JSON.parse(response.body, symbolize_names: true)
  end
end
