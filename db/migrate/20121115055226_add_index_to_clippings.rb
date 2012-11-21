class AddIndexToClippings < ActiveRecord::Migration
  def change
  	add_index :clippings, :folder_id
  end
end
