class Activity < ActiveRecord::Base
  belongs_to :habit
  belongs_to :event

  ACTION = ["No attempt", "50% completed", "Completed"]
end
