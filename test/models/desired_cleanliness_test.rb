# == Schema Information
#
# Table name: desired_cleanlinesses
#
#  id            :integer          not null, primary key
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  kitchen       :string
#  bathroom      :string
#  common_space  :string
#  preference_id :integer
#

require 'test_helper'

class DesiredCleanlinessTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
