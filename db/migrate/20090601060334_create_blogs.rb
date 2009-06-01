class CreateBlogs < ActiveRecord::Migration
  def self.up
    create_table :blogs do |t|
      t.string :feed_url
      t.timestamp :feed_updated_at
      t.text :feed_data
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :blogs
  end
end
