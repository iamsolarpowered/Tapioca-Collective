class CreateProjects < ActiveRecord::Migration
  def self.up
    create_table :projects do |t|
      t.string :name
      t.integer :client_id
      t.text :notes
      t.string :development_url
      t.string :production_url
      t.string :repository_url

      t.timestamps
    end
  end

  def self.down
    drop_table :projects
  end
end
