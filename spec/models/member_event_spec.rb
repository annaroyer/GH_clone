require 'spec_helper'

describe MemberEvent do

  subject  { MemberEvent.new({
    actor:{
      login: "lnchambers",
       avatar_url: "https://avatars.githubusercontent.com/u/32661560?"},
    repo: {name: "lnchambers/potterspec"},
    payload: {member: {login: "memcmahon"}, action: "added"},
    created_at: "2018-03-22T16:11:32Z"
  }) }

  context 'instance methods' do
    describe '#summary' do
      it 'returns a summary of the event' do
        expect(subject.summary).to eq('lnchambers added memcmahon to lnchambers/potterspec')
      end
    end
  end

  context 'attributes' do
    it 'has a user avatar' do
      expect(subject.user_avatar).to eq("https://avatars.githubusercontent.com/u/32661560?")
    end

    it 'has a created_at' do
      expect(subject.created_at).to eq("2018-03-22T16:11:32Z")
    end
  end
end
