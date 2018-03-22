FactoryBot.define do
  factory :user do
    uid 26782839
    email "anna.royer@colorado.edu"
    nickname "annaroyer"
    name "Anna Royer"
    image "https://avatars0.githubusercontent.com/u/26782839?v=4"
    bio 'Student'
    location 'Boulder, CO'
    follower_count 4
    following_count 4
    repo_count 39
    token ENV['ACCESS_TOKEN']
  end
end
