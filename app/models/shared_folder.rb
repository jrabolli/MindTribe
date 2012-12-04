# == Schema Information
#
# Table name: shared_folders
#
#  id             :integer(4)      not null, primary key
#  user_id        :integer(4)
#  shared_email   :string(255)
#  shared_user_id :integer(4)
#  folder_id      :integer(4)
#  message        :string(255)
#  created_at     :datetime
#  updated_at     :datetime
#

class SharedFolder < ActiveRecord::Base

  attr_accessible :user_id, :shared_email, :shared_user_id,  :message,  :folder_id  
    
  #this is for the owner(creator) of the assets  
  belongs_to :user  
    
  #this is for the user to whom the owner has shared folders to  
  belongs_to :shared_user, :class_name => "User", :foreign_key => "shared_user_id"  
    
  #for the folder being shared  
  belongs_to :folder  

end
