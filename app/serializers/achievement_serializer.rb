class AchievementSerializer < ActiveModel::Serializer
  embed :ids

  attributes :id, :key, :points

  has_many :golfer_achievements
end
