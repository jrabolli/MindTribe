class CreateActions < ActiveRecord::Migration
  def change
    create_table :actions do |t|
      t.text :action
      t.string :person_responsible
      t.integer :user_id
      t.integer :goal_id
      t.datetime :target_date
      t.text :result

      t.timestamps
    end

    add_index :actions, :user_id
  end
end
