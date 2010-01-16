class AddCommentsCountToPosts < ActiveRecord::Migration
  def self.up
    add_column :cms_posts, :cms_comments_count, :integer, :null => false, :default => 0
    add_column :cms_posts, :cms_approved_comments_count, :integer, :null => false, :default => 0
    add_column :cms_comments, :is_approved, :bool, :null => false, :default => false
  end

  def self.down
     remove_column :cms_posts, :cms_comments_count
     remove_column :cms_posts, :cms_approved_comments_count
     remove_column :cms_comments, :is_approved
  end
end
