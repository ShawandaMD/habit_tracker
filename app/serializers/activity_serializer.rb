class ActivitySerializer < ActiveModel::Serializer
  attributes :id, :action
  belongs_to :event
  belongs_to :habit
end
