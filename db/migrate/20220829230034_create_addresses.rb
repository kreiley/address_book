class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :town
      t.string :zip_code
      t.string :state
      t.string :country
      t.belongs_to :person, null: false, foreign_key: true

      t.timestamps
    end
  end
end
