class AddPublicAndFeaturedToProjects < ActiveRecord::Migration
  def self.up
    add_column :projects, :public, :boolean
    add_column :projects, :featured, :boolean
  end

  def self.down
    remove_column :projects, :featured
    remove_column :projects, :public
  end
end
