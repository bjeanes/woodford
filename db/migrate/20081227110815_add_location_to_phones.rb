class AddLocationToPhones < ActiveRecord::Migration
  def self.up
    add_column :phones, :location, :string
  end

  def self.down
    remove_column :phones, :location
  end
end
