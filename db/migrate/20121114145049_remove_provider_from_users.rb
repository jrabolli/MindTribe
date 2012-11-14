class RemoveProviderFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :provider
  end

  def down
    add_column :users, :provider, :boolean
  end
end
