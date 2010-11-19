class RateToPost < ActiveRecord::Migration
  def self.up
    add_column :posts, :rate, :integer, :default => 0
  end

  def self.down
    remove_column :posts, :rate
  end
end
