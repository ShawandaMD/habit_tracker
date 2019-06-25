class Activity < ActiveRecord::Base
  belongs_to :habit
  belongs_to :event
  accepts_nested_attributes_for :event, reject_if: :all_blank

  ACTION = ["No attempt", "50% completed", "Completed"]

end
