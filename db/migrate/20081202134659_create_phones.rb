class CreatePhones < ActiveRecord::Migration
  def self.up
    create_table :phones do |t|
      t.string :owner
      t.string :description
      t.datetime :time_in
      t.datetime :time_out

      t.timestamps
    end
  end

  def self.down
    drop_table :phones
  end
end
