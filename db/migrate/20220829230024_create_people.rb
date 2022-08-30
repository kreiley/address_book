class CreatePeople < ActiveRecord::Migration[7.0]
  def change
    create_table :people do |t|
      t.string :salutation
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :ssn
      t.date :birth_date
      t.text :comment
      t.string :slug

      t.timestamps
    end
    add_index :people, :slug, unique: true
  end
end
