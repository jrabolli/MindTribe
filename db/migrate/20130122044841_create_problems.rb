class CreateProblems < ActiveRecord::Migration
  def change
    create_table :problems do |t|
      t.string :problem
      t.string :code
      t.text :notes
      t.integer :user_id

      t.timestamps
    end
  end
end
