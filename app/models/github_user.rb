class GithubUser < SimpleDelegator
  def github_service
    GithubService.new(token)
  end

  def starred_repos
    github_service.get_url('user/starred')
  end

  def push_events
    get_push_events.map do |raw_event|
      PushEvent.new(raw_event)
    end
  end

  def recent_commits
    push_events.sum(&:commit_count)
  end

  def recent_repo_commits
    push_events.group_by(&:repo_name).transform_values do |events|
      events.sum(&:commit_count)
    end
  end

  private
    def get_push_events
      github_service.get_url("users/#{nickname}/events").find_all do |event|
        event[:type] == 'PushEvent'
      end
    end
end
