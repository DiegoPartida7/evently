class Event < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :tickets
  
  EVENT_TYPES = (EventTypeClosed, EventTypeOpen = 'Closed', 'Open')
  scope :closed, -> {
    where(event_type: EventTypeClosed)
  } 
  scope :open, ->{
    where(event_type: EventTypeOpen)
  } 

  def closed?
    event_type == EventTypeClosed
  end

  def open?
    event_type == EventTypeOpen
  end

end
