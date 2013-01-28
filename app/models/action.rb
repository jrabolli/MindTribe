class Action < ActiveRecord::Base
  attr_accessible :action, :goal_id, :person_responsible, :result, :target_date, :user_id
  belongs_to :goal 
  validates :action, presence: true

end
