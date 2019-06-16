class Habit < ActiveRecord::Base
  has_many :activities
  has_many :events, through: :activities 
  belongs_to :user
end
