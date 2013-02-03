# == Schema Information
#
# Table name: memberships
#
#  id         :integer(4)      not null, primary key
#  user_id    :integer(4)
#  tribe_id   :integer(4)
#  confirmed  :boolean, default => false 
#  confirmed_at :datetime, default => null
#  created_at :datetime
#  updated_at :datetime
#

class Membership < ActiveRecord::Base
  belongs_to :user
  belongs_to :tribe
  attr_accessible :user
  validates_uniqueness_of :user_id, :scope =>  :tribe_id
end
