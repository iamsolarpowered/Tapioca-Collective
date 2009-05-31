class AddNameAndTitleToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :name, :string
    add_column :users, :title, :string
  end

  def self.down
    remove_column :users, :title
    remove_column :users, :name
  end
end
