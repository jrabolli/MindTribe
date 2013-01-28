# == Schema Information
#
# Table name: goals
#
#  id                 :integer(4)      not null, primary key
#  goal               :string(255)
#  person_responsible :string(255)
#  expected_outcome   :text
#  target_date        :date
#  results            :text
#  user_id            :integer(4)
#  created_at         :datetime        not null
#  updated_at         :datetime        not null
#

require 'spec_helper'

describe Goal do
  pending "add some examples to (or delete) #{__FILE__}"
end
