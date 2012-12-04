# == Schema Information
#
# Table name: shared_folders
#
#  id             :integer(4)      not null, primary key
#  user_id        :integer(4)
#  shared_email   :string(255)
#  shared_user_id :integer(4)
#  folder_id      :integer(4)
#  message        :string(255)
#  created_at     :datetime
#  updated_at     :datetime
#

require 'spec_helper'

describe SharedFolder do
  pending "add some examples to (or delete) #{__FILE__}"
end
