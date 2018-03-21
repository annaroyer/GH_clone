class GithubUser < SimpleDelegator
  def star_count
    GithubService.new(self.token).get_url('starred').count
  end
end
