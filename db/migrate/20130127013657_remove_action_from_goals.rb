class RemoveActionFromGoals < ActiveRecord::Migration
  def up
    remove_column :goals, :action
  end

  def down
    add_column :goals, :action, :text
  end
end
