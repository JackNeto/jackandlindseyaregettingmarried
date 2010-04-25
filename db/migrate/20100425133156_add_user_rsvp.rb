class AddUserRsvp < ActiveRecord::Migration
  def self.up
    add_column :users, :rsvp, :string
    add_column :users, :food_restrictions, :text
  end

  def self.down
    add_column :users, :rsvp
    add_column :users, :food_restrictions
  end
end
