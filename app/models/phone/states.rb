module Phone::States
  include AlterEgo
  
  state :on_hold, :default => true do
    handle :state { "on_hold" }
    transition :to => :charging, :on => :charge!
    transition :to => :paused,   :on => :pause!
  end
  
  state :charging do
    handle :state { "charging" }
    transition :to => :completed_charging, :on => :complete!
  end
  
  state :paused do
    handle :state { "paused" }
    transition :to => :charging, :on => :charge!
  end
  
  state :completed_charging do
    handle :state { "completed_charging" }
    transition :to => :picked_up, :on => :pick_up!
  end
end