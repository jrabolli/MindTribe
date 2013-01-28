# == Schema Information
#
# Table name: barriers
#
#  id           :integer(4)      not null, primary key
#  barrier      :text
#  intervention :text
#  user_id      :integer(4)
#  created_at   :datetime        not null
#  updated_at   :datetime        not null
#

class Barrier < ActiveRecord::Base
  attr_accessible :barrier, :intervention, :user_id
  belongs_to :user
  validates :barrier, presence: true
end
