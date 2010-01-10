class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string    :first_name
      t.string    :last_name
      t.text      :profile
      t.string    :email,               :null => false
      t.string    :avatar_file_name
      t.integer   :avatar_file_size
      t.string    :avatar_content_type
      t.string    :role
      t.string    :crypted_password,    :null => false
      t.string    :password_salt,       :null => false
      t.string    :persistence_token,   :null => false
      t.integer   :login_count
      t.integer   :failed_login_count
      t.datetime  :last_request_at
      t.string    :relationship
      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
