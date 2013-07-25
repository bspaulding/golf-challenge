class BracketGolferSerializer < ActiveModel::Serializer
  embed :ids

  attributes :id

  has_one :bracket
  has_one :golfer
end
