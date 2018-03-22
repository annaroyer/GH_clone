class PushEvent
  attr_reader :created_at, :repo_name, :commit_count

  def initialize(attrs={})
    @created_at = attrs[:created_at]
    @repo_name = attrs[:repo][:name]
    @commit_count = attrs[:payload][:commits].count
  end
end
