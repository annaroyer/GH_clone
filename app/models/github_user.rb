class GithubUser < SimpleDelegator
  def github_service
    GithubService.new(token)
  end

  def starred_repos
    github_service.get_url('user/starred')
  end

  def events
    Event.find_by_user(nickname)
  end

  def recent_commits
    events.sum(&:commit_count)
  end

  def recent_repo_commits
    events.group_by(&:repo_name).transform_values do |events|
      events.sum(&:commit_count)
    end
  end
end
