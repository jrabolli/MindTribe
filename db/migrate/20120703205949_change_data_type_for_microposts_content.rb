class ChangeDataTypeForMicropostsContent < ActiveRecord::Migration
  def change
    change_column :microposts, :content, :text
  end
end
