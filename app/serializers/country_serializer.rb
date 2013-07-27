class CountrySerializer < ActiveModel::Serializer
  embed :ids

  attributes :id, :name, :alpha2, :alpha3

  has_many :golfers
end
