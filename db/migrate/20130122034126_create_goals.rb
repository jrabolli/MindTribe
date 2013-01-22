class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.string :goal
      t.text :action
      t.string :person_responsible
      t.text :expected_outcome
      t.date :target_date
      t.text :results
      t.integer :user_id

      t.timestamps
    end

      add_index :goals, :user_id

  end
end
