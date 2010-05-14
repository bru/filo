class CreateKnots < ActiveRecord::Migration
  def self.up
    create_table :knots do |t|
      t.string :url
      t.text :summary
      t.string :title
      t.string :state
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :knots
  end
end
