class AddStateToPhones < ActiveRecord::Migration
  def self.up
    add_column :phones, :state, :string
  end

  def self.down
    remove_column :phones, :state
  end
end
