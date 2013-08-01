class GolferSerializer < ActiveModel::Serializer
  cached
  delegate :cache_key, to: :object

  embed :ids

  attributes :id, :name, :rank

  has_many :golfer_achievements
  has_many :bracket_golfers
  has_one :country
end
