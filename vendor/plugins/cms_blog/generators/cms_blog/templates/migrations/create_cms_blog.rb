class CreateCmsBlog < ActiveRecord::Migration
  def self.up
    
    create_table :cms_posts do |t|
      t.string  :title
      t.text    :content
      t.string  :author
      t.boolean :is_published, :null => false, :default => false
      t.timestamps
    end
    add_index :cms_posts, :title
    
    
    create_table :cms_comments do |t|
      t.integer   :cms_post_id
      t.string    :name
      t.text      :content
      t.datetime  :published_at
      t.datetime  :unpublished_at
      t.timestamps
    end
    add_index :cms_comments, :cms_post_id
    
  end
  
  def self.down
    drop_table :cms_posts
    drop_table :cms_comments
  end
end
