class AddStubUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :is_stub, :boolean, :default => false, :null => false
    add_column :users, :show_in_family_page, :boolean, :default => false, :null => false
    add_column :users, :position, :integer
    add_column :users, :email_validation_key, :string
    add_column :users, :validated_at, :datetime
    change_column_null :users, :email, true
    change_column :users, :crypted_password, :string, :limit => 40, :null => true
    change_column :users, :password_salt, :string, :limit => 40, :null => true
    change_column_null :users, :persistence_token, true
    rename_column :users, :crypted_password, :password_crypt
    rename_column :users, :persistence_token, :remember_token
    remove_column :users, :profile
  end

  def self.down
    remove_column :users, :is_stub
    remove_column :users, :show_in_family_page
    remove_column :users, :position
    remove_column :users, :email_validation_key
    remove_column :users, :validated_at
    rename_column :users, :password_crypt, :crypted_password
    rename_column :users, :remember_token, :persistence_token
    change_column_null :users, :email, false
    change_column_null :users, :crypted_password, false
    change_column_null :users, :password_salt, false
    change_column_null :users, :persistence_token, false
    add_column :users, :profile, :text
  end
end
