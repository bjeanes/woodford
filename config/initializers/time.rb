ActiveSupport::CoreExtensions::Time::Conversions::DATE_FORMATS.merge!(
  :default => "%d %b %l:%M %p",
  
  :date => "%d %B %Y",
  :date_db => "%Y-%m-%d",
  :date_iso8601 => "%Y-%m-%d",
  
  :weekday => "%a %d",
  :month => "%B %Y",
  
  :time => "%I:%M %p",
  :time_24 => "%H:%M",
  :time_iso8601 => "%H:%M:%S"
)
 
ActiveSupport::CoreExtensions::Date::Conversions::DATE_FORMATS.merge!(
  :default => "%d %b",
  :date => "%d %B %Y"
)
 
# Reason: http://dev.rubyonrails.org/ticket/11455
ActiveSupport::CoreExtensions::Time::Conversions::DATE_FORMATS[:normal] = ActiveSupport::CoreExtensions::Time::Conversions::DATE_FORMATS[:default]