class GolferAchievementSerializer < ActiveModel::Serializer
  embed :ids

  attributes :id

  has_one :golfer
  has_one :achievement
end
