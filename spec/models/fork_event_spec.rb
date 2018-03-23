require 'spec_helper'

describe ForkEvent do

  subject { ForkEvent.new({
    :actor=>{
      :login=>"mgmilton",
      :avatar_url=>"https://avatars.githubusercontent.com/u/7215067?"
    },
    :repo=>{:name=>"annaroyer/sorting_suite"},
    :payload=>{:forkee=>{:full_name=>"mgmilton/sorting_suite-1"}},
    :created_at=>"2018-03-08T18:30:12Z"
  }) }

  context 'instance methods' do
    describe '#summary' do
      it 'returns a summary of the event' do
        expect(subject.summary).to eq('mgmilton forked mgmilton/sorting_suite-1 from annaroyer/sorting_suite')
      end
    end
  end

  context 'attributes' do
    it 'has a user avatar' do
      expect(subject.user_avatar).to eq("https://avatars.githubusercontent.com/u/7215067?")
    end

    it 'has a created_at' do
      expect(subject.created_at).to eq("2018-03-08T18:30:12Z")
    end
  end
end
