class CreateBusinesses < ActiveRecord::Migration[5.1]
  def change
    create_table :businesses do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.string :zipcode
      t.string :phone
      t.string :email
      t.text :description

      t.timestamps
    end
  end
end
