class HabitSerializer < ActiveModel::Serializer
  attributes :id, :name, :category, :goal, :user_id
  has_many :activities
  has_many :events
end
