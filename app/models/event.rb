class Event < ActiveRecord::Base
  has_many :event_attendings
  belongs_to :creator, :class_name => "User"
  has_many :attendees, :through => :event_attendings, :source => :user
  scope :upcoming, -> { where("date > ?", Time.now)}
  scope :past , -> {where("date < ?", Time.now)}

end
