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

require 'spec_helper'

describe Problem do
  pending "add some examples to (or delete) #{__FILE__}"
end
