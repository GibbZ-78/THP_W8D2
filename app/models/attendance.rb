class Attendance < ApplicationRecord
  ## PUBLIC SECTION ##

  # RELATIONS
  belongs_to :attendee, class_name: "User"
  belongs_to :event

  # CALL-BACKS
  after_create :attendee_send   # Event ticket booking confirmation mail to attendee
  after_create :promoter_send   # New booking information mail to event promoter

  ## PRIVATE SECTION ##
  private 

  # Sending mail to each new participant to a given event (i.e. each time a new attendance is created)
  def attendee_send
    puts "[DEBUG] Attendee: #{self.attendee.first_name} #{self.attendee.last_name} - Event: #{self.event.title}"
    AttendanceMailer.register_email(self.attendee, self.event).deliver_now
  end

  # For each new participant to a given event, sending an in fo mail to the event promoter (owner / admin)
  def promoter_send
    puts "[DEBUG] Promoter: #{self.event.promoter.first_name} #{self.promoter.last_name} - Attendee: #{self.attendee.first_name} #{self.attendee.last_name} - Event: #{self.event.title}"
    AttendanceMailer.new_registration_email(self.event.promoter, self.attendee, self.event).deliver_now
  end

end
