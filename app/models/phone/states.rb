module Phone::States
  include AlterEgo
  
  state :paused, :default => true do
    handle(:state) { "paused" }
    transition :to => :charging, :on => :charge!
  end
  
  state :charging do
    handle(:state) { "charging" }
    transition :to => :completed_charging, :on => :complete!
    transition :to => :paused,   :on => :pause!
  end
  
  state :completed_charging do
    handle(:state) { "completed_charging" }
    transition :to => :picked_up, :on => :pick_up!
  end
end