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

require 'spec_helper'

describe Barrier do
  pending "add some examples to (or delete) #{__FILE__}"
end
