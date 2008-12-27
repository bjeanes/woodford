class CreatePhones < ActiveRecord::Migration
  def self.up
    create_table :phones do |t|
      t.string :owner
      t.string :description
      t.datetime :dropped_off_at
      t.datetime :charging_at
      t.datetime :charged_at
      t.datetime :picked_up_at
    end
  end

  def self.down
    drop_table :phones
  end
end
