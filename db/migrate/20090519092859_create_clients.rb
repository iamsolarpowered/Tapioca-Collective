class CreateClients < ActiveRecord::Migration
  def self.up
    create_table :clients do |t|
      t.string :name
      t.text :notes
      t.text :address
      t.string :city
      t.string :province
      t.string :country
      t.string :postal_code

      t.timestamps
    end
  end

  def self.down
    drop_table :clients
  end
end
