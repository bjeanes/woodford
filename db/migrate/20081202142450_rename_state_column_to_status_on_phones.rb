class RenameStateColumnToStatusOnPhones < ActiveRecord::Migration
  def self.up
    rename_column :phones, :state, :status
  end

  def self.down
    rename_column :phones, :status, :state
  end
end
