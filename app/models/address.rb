class Address < ApplicationRecord
  validates :street, presence: true
  validates :zip_code, presence: true
  validates :town, presence: true
  belongs_to :person
end
