class BracketGolfer < ActiveRecord::Base
  belongs_to :bracket, touch: true
  belongs_to :golfer, touch: true
end
