require 'spec_helper'

describe CreateEvent do

  subject { CreateEvent.new(attributes) }

  context 'instance methods' do
    describe '#summary' do
      it 'returns a summary of the event' do
        expect(subject.summary).to eq('slimecog created a repository slimecog/black_thursday')
      end
    end
  end

  context 'attributes' do
    it 'has a user avatar' do
      expect(subject.user_avatar).to eq('https://avatars.githubusercontent.com/u/30604838?')
    end

    it 'has a created_at' do
      expect(subject.created_at).to eq('2018-03-19T21:21:41Z')
    end
  end
end

def attributes
  {
    :actor=>{
      :login=>"lnchambers",
      :avatar_url=>"https://avatars.githubusercontent.com/u/32661560?"
    },
    :repo=>{:name=>"lnchambers/potterspec"},
    :created_at=>"2018-03-21T16:01:05Z"
  }
end
