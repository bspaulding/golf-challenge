class GolferSerializer < ActiveModel::Serializer
  embed :ids, :include => true

  attributes :id, :name, :rank

  has_many :golfer_achievements
  has_many :bracket_golfers
  has_one :country
end
