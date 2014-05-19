class AddEmailUniquenessIndex < ActiveRecord::Migration
  def self.up
    add_index :believers, :email, :unique => true
  end

  def self.down
  	remove_index :users, :email
  end
end
