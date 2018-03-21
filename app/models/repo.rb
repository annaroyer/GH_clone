class Repo
  attr_reader :name, :language, :forks_count, :fork, :updated_at

  def initialize(attrs={})
    @name = attrs[:name]
    @language = attrs[:language]
    @forks_count = attrs[:forks_count]
    @fork = attrs[:fork]
    @updated_at = attrs[:updated_at]
  end
end
