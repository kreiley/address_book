class Address < ApplicationRecord
  validates :street, presence: true
  validates :zip_code, presence: true
  validates :town, presence: true
  belongs_to :person
  belongs_to :user
  before_create :populate_person

  private

  def populate_person
    self.user = self.person.user
  end

end
