class CreateMedications < ActiveRecord::Migration
  def change
    create_table :medications do |t|
      t.string :name
      t.string :problem
      t.string :dosage
      t.string :instructions
      t.integer :user_id

      t.timestamps
    end

    add_index :medications, :user_id
  end
end
