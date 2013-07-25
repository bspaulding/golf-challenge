class Achievement < ActiveRecord::Base
  has_many :golfer_achievements
  has_many :golfers, :through => :golfer_achievements
end
