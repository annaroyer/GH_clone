class WatchEvent
  attr_reader :user_avatar,
              :created_at

  def initialize(attrs={})
    @user_name = attrs[:actor][:login]
    @user_avatar = attrs[:actor][:avatar_url]
    @repo_name = attrs[:repo][:name]
    @action = attrs[:payload][:action]
    @created_at = attrs[:created_at]
  end

  def summary
    "#{user_name} #{action} watching #{repo_name}"
  end

  private
    attr_reader :user_name,
                :repo_name,
                :action

end
