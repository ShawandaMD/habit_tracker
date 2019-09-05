class EventSerializer < ActiveModel::Serializer
  attributes :id, :occurance
  has_many :activities
end

###DELETE THIS FILE NOT NEEDED!
