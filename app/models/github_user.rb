class GithubUser < SimpleDelegator
  def github_service
    GithubService.new(token)
  end

  def starred_repos
    github_service.get_url('user/starred')
  end

  def recent_commits
    push_events.sum(&:commit_count)
  end

  def recent_repo_commits
    push_events.group_by(&:repo_name).transform_values do |events|
      events.sum(&:commit_count)
    end
  end

  def activity_events
    github_service.get_url("users/#{nickname}/received_events").map do |event|
      case event[:type]
      when 'MemberEvent' then MemberEvent.new(event)
      when 'CreateEvent' then CreateEvent.new(event)
      when 'WatchEvent' then WatchEvent.new(event)
      when 'ForkEvent' then ForkEvent.new(event)
      end
    end
  end

  def repos
    github_service.get_url("user/repos?per_page=#{repo_count}").map do |raw_repo|
      Repo.new(raw_repo)
    end
  end

  def pinned_repos
    repos.sample(6)
  end

  def organizations
    github_service.get_url("users/#{nickname}/orgs").map do |org|
      Organization.new(org) if org
    end
  end

  private
    def push_events
      get_push_events.map do |raw_event|
        PushEvent.new(raw_event)
      end
    end

    def get_push_events
      github_service.get_url("users/#{nickname}/events").find_all do |event|
        event[:type] == 'PushEvent'
      end
    end
end
