# == Schema Information
#
# Table name: preferences
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Preference < ActiveRecord::Base
  belongs_to :user
  has_one :desired_cleanliness
  has_one :desired_schedule
  has_one :desired_habit
end