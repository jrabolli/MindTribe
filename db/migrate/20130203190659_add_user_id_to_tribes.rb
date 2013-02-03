class AddUserIdToTribes < ActiveRecord::Migration
  def change
    add_column :tribes, :owner_id, :integer
  end
end
