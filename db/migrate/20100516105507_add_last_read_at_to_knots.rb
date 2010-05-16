class AddLastReadAtToKnots < ActiveRecord::Migration
  def self.up
    add_column :knots, :last_read_at, :datetime
  end

  def self.down
    remove_column :knots, :last_read_at
  end
end