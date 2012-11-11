# == Schema Information
#
# Table name: clippings
#
#  id                         :integer(4)      not null, primary key
#  user_id                    :integer(4)
#  created_at                 :datetime
#  updated_at                 :datetime
#  uploaded_file_file_name    :string(255)
#  uploaded_file_content_type :string(255)
#  uploaded_file_file_size    :integer(4)
#  uploaded_file_updated_at   :datetime
#

require 'spec_helper'

describe Clipping do
  pending "add some examples to (or delete) #{__FILE__}"
end
