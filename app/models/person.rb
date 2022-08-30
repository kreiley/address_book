class Person < ApplicationRecord
    validates :first_name, presence: true
    validates :last_name, presence: true
    has_many :addresses, dependent: :destroy
    has_many :emails, dependent: :destroy
    has_many :phones, dependent: :destroy
    belongs_to :user

    before_create :slugify

    def slugify
        nameDups = Person.where(first_name: first_name, middle_name: middle_name, last_name: last_name).count
        url = ((first_name || "") + " " + (middle_name || "") + " " + (last_name || "")).parameterize
        if nameDups > 0
            self.slug = url + String(nameDups)
        else
            self.slug = url
        end
    end

end
