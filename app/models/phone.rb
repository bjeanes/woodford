class Phone < ActiveRecord::Base
  validates_presence_of :owner, :description
  before_create :set_dropped_off_at
  
  
  def charging!
    unless charging_at?
      self.charging_at = Time.now
    end
  end
  
  protected
  
    def set_dropped_off_at
      self.dropped_off_at = Time.now
    end
end
