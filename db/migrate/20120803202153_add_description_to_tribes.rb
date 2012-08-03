class AddDescriptionToTribes < ActiveRecord::Migration
  def change
  	add_column :tribes, :description, :text
  end
end
