class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.integer :uid
      t.string :email
      t.string :nickname
      t.string :name
      t.string :image
      t.string :bio
      t.string :location
      t.integer :repo_count
      t.integer :follower_count
      t.integer :following_count
      t.string :token
    end
  end
end
