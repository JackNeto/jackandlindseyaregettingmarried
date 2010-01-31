class AddShowInToUsers < ActiveRecord::Migration
  def self.up
    remove_column :users, :show_in_family_page
    add_column :users, :show_in, :string
  end

  def self.down
    add_column :users, :show_in_family_page, :boolean, :default => false, :null => false
    remove_column :users, :show_in
  end
end
