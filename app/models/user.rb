class User < ActiveRecord::Base
  has_many :event_attendings
  has_many :events_created, :foreign_key => "creator_id", :class_name => "Event"
  has_many :events_attending, :through => :event_attendings, :source => :event

  def upcoming_events
    now = Time.now
    self.events_attending.where( "date > ?", now)
  end
  def past_events
    now = Time.now
    self.events_attending.where( "date < ?", now)
  end
end
