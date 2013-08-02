class GolferAchievement < ActiveRecord::Base
  belongs_to :golfer, touch: true
  belongs_to :achievement, touch: true
end
