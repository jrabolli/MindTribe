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

attr_accessible :name, :description

validates :name, :presence   => true,
		  :length   => { :maximum => 50 },
		  :uniqueness => {:case_sensitive => false }


#added for tribes??
has_many :memberships
has_many :users, :through => :memberships
#####




end
