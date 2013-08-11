class Attendee < ActiveRecord::Base
  belongs_to :event
  belongs_to :attendant, class_name: "User"
end
