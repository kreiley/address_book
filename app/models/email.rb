class Email < ApplicationRecord
  validates :email_address, presence: true
  belongs_to :person
  belongs_to :user

end
