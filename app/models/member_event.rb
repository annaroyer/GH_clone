class MemberEvent
  attr_reader :user_avatar,
              :created_at

  def initialize(attrs={})
    @user_avatar = attrs[:actor][:avatar_url]
    @user_name = attrs[:actor][:login]
    @action = attrs[:payload][:action]
    @member = attrs[:payload][:member][:login]
    @repo_name = attrs[:repo][:name]
    @created_at = attrs[:created_at]
  end

  def summary
    "#{user_name} #{action} #{member} to #{repo_name}"
  end

  private
    attr_reader :user_name,
                :action,
                :member,
                :repo_name
end
