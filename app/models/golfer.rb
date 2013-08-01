class Golfer < ActiveRecord::Base
  include CacheableModel

  has_many :bracket_golfers
  has_many :brackets, :through => :bracket_golfers

  has_many :golfer_achievements
  has_many :achievements, :through => :golfer_achievements

  belongs_to :country

  validates :name, :rank, :country, :presence => true
end
