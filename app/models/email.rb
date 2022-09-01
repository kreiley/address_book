class Email < ApplicationRecord
  validates :email_address, presence: true
  belongs_to :person
  belongs_to :user
  has_rich_text :comment

end
