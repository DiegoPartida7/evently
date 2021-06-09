class Event < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :tickets
  has_secure_token :token
  has_secure_token :auth_token, length: 36

  validates_presence_of :image
  validates_presence_of :price
  validates_presence_of :title
  validates_presence_of :description
  validates_presence_of :tickets_available
  validates_presence_of :date
  
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
