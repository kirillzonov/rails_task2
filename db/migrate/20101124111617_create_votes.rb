class CreateVotes < ActiveRecord::Migration
  def self.up
    create_table :votes do |t|
      t.integer :post_id
      t.string :user_ip

      t.timestamps
    end
  end

  def self.down
    drop_table :votes
  end
end
