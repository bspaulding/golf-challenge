class BracketGolfer < ActiveRecord::Base
  belongs_to :bracket
  belongs_to :golfer
end
