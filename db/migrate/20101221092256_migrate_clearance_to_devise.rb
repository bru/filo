class MigrateClearanceToDevise < ActiveRecord::Migration
  def self.up
    rename_column :users, :salt, :password_salt
    remove_column :users, :confirmation_token
    remove_column :users, :email_confirmed
    
    
    change_column :users, :remember_token, :string, :limit => 255
    add_column :users, :reset_password_salt, :string
    add_column :users, :reset_password_token, :string
    add_column :users, :remember_created_at, :datetime
    
  end

  def self.down
    remove_column :users, :remember_created_at
    remove_column :users, :reset_password_token
    remove_column :users, :reset_password_salt
    change_column :users, :remember_token, :string
    rename_column :users, :password_salt, :salt
    add_column :users, :email_confirmed, :boolean,                   :default => false, :null => false
    add_column :users, :remember_token, :string,     :limit => 128
    add_column :users, :confirmation_token, :string, :limit => 128
    add_column :users, :salt, :string,               :limit => 128
    add_column :users, :encrypted_password, :string, :limit => 128
  end
end