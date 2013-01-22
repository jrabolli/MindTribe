# == Schema Information
#
# Table name: goals
#
#  id                 :integer(4)      not null, primary key
#  goal               :string(255)
#  action             :text
#  person_responsible :string(255)
#  expected_outcome   :text
#  target_date        :date
#  results            :text
#  user_id            :integer(4)
#  created_at         :datetime        not null
#  updated_at         :datetime        not null
#

class Goal < ActiveRecord::Base
  attr_accessible :action, :expected_outcome, :goal, :person_responsible, :results, :target_date, :user_id
end
