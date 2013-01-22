class AddIndexToProblems < ActiveRecord::Migration
  def change
  	add_index :problems, :user_id
  end
end
