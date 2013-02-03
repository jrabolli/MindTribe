class AddConfirmedToMembership < ActiveRecord::Migration
  def change
    add_column :memberships, :confirmed, :boolean, :default => false
    add_column :memberships, :confirmed_on, :datetime, :default => nil
  end
end
