# == Schema Information
#
# Table name: problems
#
#  id         :integer(4)      not null, primary key
#  problem    :string(255)
#  code       :string(255)
#  notes      :text
#  user_id    :integer(4)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Problem < ActiveRecord::Base
  attr_accessible :code, :notes, :problem, :user_id
  belongs_to :user
  validates :problem, presence: true
end
