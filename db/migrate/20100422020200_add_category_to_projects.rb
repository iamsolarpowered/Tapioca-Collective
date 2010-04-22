class AddCategoryToProjects < ActiveRecord::Migration
  def self.up
    add_column :projects, :category, :string
    add_index  :projects, :category
  end

  def self.down
    remove_column :projects, :category
  end
end
