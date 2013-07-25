class Bracket < ActiveRecord::Base
  has_many :bracket_golfers
  has_many :golfers, :through => :bracket_golfers
end
