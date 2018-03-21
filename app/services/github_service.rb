class GithubService < ApplicationController
  def initialize(token)
    @conn = Faraday.new("https://api.github.com/user") do |faraday|
      faraday.headers[:access_token] = token
      faraday.adapter Faraday.default_adapter
    end
  end

  def get_url(url)
    response = @conn.get(url)
    JSON.parse(response.body, symbolize_names: true)[:results]
  end
end
