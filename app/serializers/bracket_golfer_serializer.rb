class BracketGolferSerializer < ActiveModel::Serializer
  cached
  delegate :cache_key, to: :object

  embed :ids

  attributes :id

  has_one :bracket
  has_one :golfer
end
