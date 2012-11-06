class AddNameUniquenessIndex < ActiveRecord::Migration
  def up
  	    add_index :tribes, :name, :unique => true
  end

  def down
  	    remove_index :tribes, :name
  end
end
