# == Schema Information
#
# Table name: memberships
#
#  id         :integer(4)      not null, primary key
#  user_id    :integer(4)
#  tribe_id   :integer(4)
#  created_at :datetime
#  updated_at :datetime
#

class Membership < ActiveRecord::Base

	#added for tribes ??
	attr_accessible :tribe_id

	belongs_to :user
	belongs_to :Membership

	###
end
