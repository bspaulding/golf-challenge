class GolferAchievementSerializer < ActiveModel::Serializer
  cached
  delegate :cache_key, to: :object

  embed :ids

  attributes :id

  has_one :golfer
  has_one :achievement
end
