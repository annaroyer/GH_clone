require 'spec_helper'

describe MemberEvent do

  subject  { MemberEvent.new(attributes) }

  context 'instance methods' do
    describe '#summary' do
      xit 'returns a summary of the event' do
        expect(subject.summary).to eq('lnchambers added memcmahon to lnchambers/potterspec')
      end
    end
  end

  context 'attributes' do
    xit 'has a user avatar' do
      expect(subject.user_avatar).to eq("https://avatars.githubusercontent.com/u/32661560?")
    end

    xit 'has a created_at' do
      expect(subject.created_at).to eq("2018-03-22T16:11:32Z")
    end
  end
end

def attributes
  {
    actor:{
      login: "lnchambers",
       avatar_url: "https://avatars.githubusercontent.com/u/32661560?"},
    repo: {name: "lnchambers/potterspec"},
    payload: {member: {login: "memcmahon"}, action: "added"},
    created_at: "2018-03-22T16:11:32Z"
  }
end
