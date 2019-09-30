class EventSerializer < ActiveModel::Serializer
  attributes :id, :occurance, :comment
  has_many :activities
end
