class Event
  attr_reader :created_at, :repo_name, :commit_count

  def initialize(attrs={})
    @created_at = attrs[:created_at]
    @repo_name = attrs[:repo][:name]
    @commit_count = attrs[:payload][:commits].count
  end

  def self.find_by_user(name)
    filter_events(name).map do |raw_event|
      Event.new(raw_event)
    end
  end

  private
    def self.filter_events(name)
      GithubService.get_url("users/#{name}/events").find_all do |event|
        event[:type] == 'PushEvent'
      end
    end
end
