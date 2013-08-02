class BracketSerializer < ActiveModel::Serializer
  cached
  delegate :cache_key, to: :object

  embed :ids, :include => true

  attributes :id

  has_many :bracket_golfers
end
