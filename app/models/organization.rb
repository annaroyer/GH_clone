class Organization
  attr_reader :name,
              :avatar_url

  def initialize(attrs={})
    @name = attrs[:login]
    @avatar_url = attrs[:avatar_url]
  end
end
