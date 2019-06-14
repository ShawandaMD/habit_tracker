class Event < ActiveRecord::Base
  has_many :activities
  has_many :habits, through: :activities 
end
