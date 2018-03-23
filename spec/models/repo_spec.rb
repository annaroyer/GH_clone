require 'spec_helper'

describe Repo do
  context 'attributes' do
    before(:each) do
      @repo = Repo.new({
               :name=>"activerecord_exploration",
               :html_url=>"https://github.com/annaroyer/activerecord_exploration",
               :fork=>true,
               :updated_at=>"2018-01-19T18:06:07Z",
               :language=>"Ruby",
               :forks=>0,
               :open_issues=>0,
             })
     end
    it 'has a name' do
      expect(@repo.name).to eq("activerecord_exploration")
    end

    it 'has a url' do
      expect(@repo.html_url).to eq("https://github.com/annaroyer/activerecord_exploration")
    end

    it 'has a language' do
      expect(@repo.language).to eq("Ruby")
    end

    it 'has an updated_at' do
      expect(@repo.updated_at).to eq("2018-01-19T18:06:07Z")
    end
  end
end

def attributes
  {
   :name=>"activerecord_exploration",
   :html_url=>"https://github.com/annaroyer/activerecord_exploration",
   :fork=>true,
   :updated_at=>"2018-01-19T18:06:07Z",
   :language=>"Ruby",
   :forks=>0,
   :open_issues=>0,
 }
end
