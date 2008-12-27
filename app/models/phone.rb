class Phone < ActiveRecord::Base
  DEFAULT_TIME = 2.hours
  
  validates_presence_of :owner, :description
  validates_presence_of :location, :if => :charging?, 
    :message => "can't be blank if it's charging, idiot."
  validates_format_of :location, :with => /[A-Z]\d{1,2}/,
    :message => "needs to be of format A3, F11, E7, etc", 
    :allow_nil => true, :allow_blank => true
  
  before_create :set_dropped_off_at
  
  named_scope :overdue, lambda { 
    { :conditions => ["charged_at IS NULL AND charging_at <= ?", DEFAULT_TIME.ago] } }
  
  
  def charging!
    unless charging_at?
      self.charging_at = Time.now
    end
  end
  
  def ticket_number
    "%04d" % id
  end
  
  def charging?
    charging_at?
  end
  
  protected
  
    def set_dropped_off_at
      self.dropped_off_at = Time.now
    end
end
