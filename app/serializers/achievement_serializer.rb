class AchievementSerializer < ActiveModel::Serializer
  cached
  delegate :cache_key, to: :object

  embed :ids

  attributes :id, :key, :points

  has_many :golfer_achievements
end
