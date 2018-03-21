class GithubUser < SimpleDelegator    
  def github_service
    GithubService.new(token)
  end

  def starred_repos
    # github_service.get_url('user/starred').map do |raw_repo|
    #   Repo.new(raw_repo)
    # end

    github_service.get_url('user/starred')
  end
end
