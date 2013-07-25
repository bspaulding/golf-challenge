class BracketSerializer < ActiveModel::Serializer
  embed :ids

  attributes :id

  has_many :bracket_golfers
end
