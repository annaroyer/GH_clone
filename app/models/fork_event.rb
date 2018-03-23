class ForkEvent
  attr_reader :user_avatar,
              :created_at

  def initialize(attrs={})
    @user_avatar = attrs[:actor][:avatar_url]
    @user_name = attrs[:actor][:login]
    @repo_name = attrs[:payload][:forkee][:full_name]
    @forkee = attrs[:repo][:name]
    @created_at = attrs[:created_at]
  end

  def summary
    "#{user_name} forked #{repo_name} from #{forkee}"
  end

  private
    attr_reader :user_name,
                :repo_name,
                :forkee
end
