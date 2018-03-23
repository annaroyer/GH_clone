class Repo
  attr_reader :name,
              :language,
              :html_url,
              :forks_count,
              :fork,
              :updated_at

  def initialize(attrs={})
    @name = attrs[:name]
    @html_url = attrs[:owner][:html_url]
    @language = attrs[:language]
    @forks_count = attrs[:forks_count]
    @fork = attrs[:fork]
    @updated_at = attrs[:updated_at]
  end
end
