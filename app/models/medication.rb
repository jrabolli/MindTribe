# == Schema Information
#
# Table name: medications
#
#  id           :integer(4)      not null, primary key
#  name         :string(255)
#  problem      :string(255)
#  dosage       :string(255)
#  instructions :string(255)
#  user_id      :integer(4)
#  created_at   :datetime        not null
#  updated_at   :datetime        not null
#

class Medication < ActiveRecord::Base
  attr_accessible :dosage, :instructions, :name, :problem, :user_id
  belongs_to :user
  validates :name, presence: true
end
