class GithubService < ApplicationController
  def initialize(access_token)
    @access_token = access_token
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  private
    attr_reader :access_token

    def conn
      Faraday.new('https://api.github.com', headers: headers)
    end

    def headers
      { authorization: "token #{access_token}" }
    end
end
