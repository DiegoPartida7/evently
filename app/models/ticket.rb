class Ticket < ApplicationRecord
  validate :validate_quantity
  # after_create :substract_ticket

  has_secure_token :token
  has_secure_token :auth_token, length: 36

  belongs_to :user
  belongs_to :event


  private

  def validate_quantity
    if(event.tickets_available<=1)
      errors.add(:base, "Ya no hay tickets")
    end
  end

  # def substract_ticket
  #   event.tickets_available = (event.tickets_available - 1)
  #   event.save!
  # end

end
