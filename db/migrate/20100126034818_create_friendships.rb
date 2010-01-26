class CreateFriendships < ActiveRecord::Migration
  def self.up
    create_table :friendships do |t|
      t.integer :user_id
      t.integer :friend_id
      t.datetime :created_at
    end
    add_index :friendships, [:user_id, :friend_id, :created_at]
  end

  def self.down
    drop_table :friendships
  end
end
