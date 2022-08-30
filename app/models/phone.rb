class Phone < ApplicationRecord
  validates :phone_number, presence: true
  belongs_to :person
end
