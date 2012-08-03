# == Schema Information
#
# Table name: tribes
#
#  id          :integer(4)      not null, primary key
#  name        :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  description :text
#

class Tribe < ActiveRecord::Base

	#added for tribes??
	has_many :memberships
	has_many :users, :through => :memberships
	#####
end
