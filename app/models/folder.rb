# == Schema Information
#
# Table name: folders
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  parent_id  :integer(4)
#  user_id    :integer(4)
#  created_at :datetime
#  updated_at :datetime
#

class Folder < ActiveRecord::Base

	acts_as_tree

	belongs_to :user
	has_many :clippings, :dependent => :destroy
	has_many :shared_folders, :dependent => :destroy  

	#a method to check if a folder has been shared or not  
	def shared?  
    	!self.shared_folders.empty?  
	end  

end
