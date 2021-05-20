class Ticket < ApplicationRecord
  has_secure_token
  has_secure_token :auth_token, length: 36
  belongs_to :user
  belongs_to :event
end
