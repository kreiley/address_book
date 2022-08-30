class Email < ApplicationRecord
  validates :email_address, presence: true, presence
  belongs_to :person
end
