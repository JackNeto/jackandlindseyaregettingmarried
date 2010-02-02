class AddUserIdToComments < ActiveRecord::Migration
  def self.up
    add_column :cms_comments, :user_id, :integer
  end

  def self.down
    remove_column :cms_comments, :user_id
  end
end
