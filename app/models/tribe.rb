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

belongs_to :owner, :class_name => "User"

has_many :memberships
has_many :members,
         :through => :memberships,
         :source => :user

has_many :active_members, 
         :through => :memberships,
         :source => :user,
         :conditions => "memberships.confirmed = 't'"

has_many :pending_members,
         :through => :memberships,
         :source => :user,
         :conditions => "memberships.confirmed = 'f'"
end
