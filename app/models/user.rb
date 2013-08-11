class User < ActiveRecord::Base
  has_many :created_events, class_name: "Event", foreign_key: :creator_id
  has_many :attended_events, class_name: "Attendee", foreign_key: :attendant_id


  #validates :username, presence: true, uniqueness: true, length: { in: 2..25 }

  validates :email, presence: true, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message: "%{value} is not a valid email address." }

  #validates :password, presence: { message: "Password cannot be empty" }
                                   #length: {
                                    #         in: 6..15,
                                     #        too_short: "Password is too short, must be longer than %{value} characters long",
                                      #       too_long: "Password is too long, must be shorter than %{value} characters long"
                                       #     }


  #has_secure_password

end
