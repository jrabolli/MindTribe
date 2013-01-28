class CreateBarriers < ActiveRecord::Migration
  def change
    create_table :barriers do |t|
      t.text :barrier
      t.text :intervention
      t.integer :user_id

      t.timestamps
    end

    add_index :barriers, :user_id

  end
end
