class GolferAchievement < ActiveRecord::Base
  belongs_to :golfer
  belongs_to :achievement
end
