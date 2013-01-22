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

require 'spec_helper'

describe Medication do
  pending "add some examples to (or delete) #{__FILE__}"
end
