class Phone < ApplicationRecord
  validates :phone_number, presence: true
  belongs_to :person
  belongs_to :user

end
