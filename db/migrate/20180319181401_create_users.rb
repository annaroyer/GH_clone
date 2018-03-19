class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.integer :uid
      t.string :email
      t.string :nickname
      t.string :name
      t.string :image
      t.string :token
      t.timestamps
    end
  end
end
