# == Schema Information
#
# Table name: clippings
#
#  id                         :integer(4)      not null, primary key
#  user_id                    :integer(4)
#  created_at                 :datetime
#  updated_at                 :datetime
#  uploaded_file_file_name    :string(255)
#  uploaded_file_content_type :string(255)
#  uploaded_file_file_size    :integer(4)
#  uploaded_file_updated_at   :datetime
#

class Clipping < ActiveRecord::Base

	attr_accessible :user_id, :uploaded_file 

	belongs_to :user

	#set up "uploaded_file" field as attached_file (using Paperclip)  
	has_attached_file :uploaded_file  
  
	validates_attachment_size :uploaded_file, :less_than => 10.megabytes 
   
	validates_attachment_presence :uploaded_file  

	def file_name  
    uploaded_file_file_name  
	end  
end
