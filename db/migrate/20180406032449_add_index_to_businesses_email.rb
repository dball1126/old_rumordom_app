class AddIndexToBusinessesEmail < ActiveRecord::Migration[5.1]
  def change
    add_index :businesses, :email, unique: true
  end
end
