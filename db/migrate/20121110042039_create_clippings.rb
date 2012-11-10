class CreateClippings < ActiveRecord::Migration
  def change
    create_table :clippings do |t|
      t.integer :user_id

      t.timestamps
    end

    add_index :clippings, :user_id
  end
end
