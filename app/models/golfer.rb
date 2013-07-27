class Golfer < ActiveRecord::Base
  has_many :bracket_golfers
  has_many :brackets, :through => :bracket_golfers

  has_many :golfer_achievements
  has_many :achievements, :through => :golfer_achievements

  belongs_to :country
end
