class AddCachedSlugToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :cached_slug, :string
  end

  def self.down
    remove_column :users, :cached_slug
  end
end
