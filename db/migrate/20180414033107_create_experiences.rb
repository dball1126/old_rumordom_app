class CreateExperiences < ActiveRecord::Migration[5.1]
  def change
    create_table :experiences do |t|
      t.text :comment
      t.references :user, foreign_key: true
      t.references :business, foreign_key: true

      t.timestamps
    end
    add_index :experiences, [:user_id, :created_at]
    add_index :experiences, [:business_id, :created_at]
  end
end
