class Activity < ApplicationRecord
  belongs_to :habit
  belongs_to :event
end
