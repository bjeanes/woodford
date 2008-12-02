class Phone < ActiveRecord::Base
  include AlterEgo
  
  state :on_hold, :default => true do
    handle :state { "on_hold" }
  end
end
