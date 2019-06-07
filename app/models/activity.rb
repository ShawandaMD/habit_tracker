class Activity < ActiveRecord::Base
  belongs_to :habit
  belongs_to :event
end
