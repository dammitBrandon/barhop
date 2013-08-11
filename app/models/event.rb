class Event < ActiveRecord::Base
  belongs_to :creator, class_name: "User"
  has_many   :attendees
  has_many   :attendants, through: :attendees, class_name: "User"
end
