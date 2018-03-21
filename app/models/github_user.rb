class GithubUser < SimpleDelegator
  def star_count
    GithubService.new(token).get_url('/starred')
  end
end
