module Phone::States
  def self.included(klass)
    klass.instance_eval do
      include AlterEgo

      state :paused, :default => true do
        transition :to => :charging, :on => :charge!
      end

      state :charging do
        transition :to => :completed_charging, :on => :complete!
        transition :to => :paused,   :on => :pause!
      end

      state :completed_charging do
        transition :to => :picked_up, :on => :pick_up!
      end
    end
  end
end