class LimitFieldSizes < ActiveRecord::Migration
  def self.up
    change_column :users, :nickname, :string, :limit => 40
    change_column :users, :cached_slug, :string, :limit => 40
    change_column :users, :language, :string, :limit => 6
    change_column :users, :email, :string, :limit => 128
    change_column :knots, :summary, :string, :limit => 160
    change_column :knots, :title, :string, :limit => 128
    change_column :knots, :state, :string, :limit => 16
  end

  def self.down
    change_column :knots, :state, :string
    change_column :knots, :title, :string
    change_column :knots, :summary, :text
    change_column :users, :language, :string
    change_column :users, :nickname, :string
    change_column :users, :cached_slug, :string
    change_column :users, :email, :string
  end
end