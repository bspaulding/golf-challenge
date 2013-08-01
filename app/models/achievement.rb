class Achievement < ActiveRecord::Base
  include CacheableModel

  has_many :golfer_achievements
  has_many :golfers, :through => :golfer_achievements
end
