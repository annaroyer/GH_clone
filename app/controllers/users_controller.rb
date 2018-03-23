class UsersController < ApplicationController
  def show
    @github_user = GithubUser.new(current_user)
  end

  def index
    @github_user = GithubUser.new(current_user)
  end
end
