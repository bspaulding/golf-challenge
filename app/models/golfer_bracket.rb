class GolferBracket < ActiveRecord::Base
  belongs_to :golfer
  belongs_to :bracket
end
