require 'spec_helper'

describe WatchEvent do
  subject { WatchEvent.new(attributes) }
  context 'instance methods' do
    describe '#summary' do
      it 'returns a summary of the event' do
        expect(subject.summary).to eq('slimecog started watching slimecog/black_thursday')
      end
    end
  end
end

def attributes
  {
    actor: {
      login: "slimecog",
      avatar_url: "https://avatars.githubusercontent.com/u/30604838?"
      },
    repo: {name: "slimecog/black_thursday"},
    payload: {action: "started"},
    created_at: "2018-03-19T21:21:41Z"
  }
end
