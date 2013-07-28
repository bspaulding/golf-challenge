class BracketSerializer < ActiveModel::Serializer
  embed :ids, :include => true

  attributes :id

  has_many :bracket_golfers
end
