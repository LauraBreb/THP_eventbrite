class Attendance < ApplicationRecord
  belongs_to :user
  belongs_to :event

  after_create :send_participation_notification

  def self.get_participants(event)
    list_of_participants =[]
    Attendance.all.each do |attendance|
      if attendance.event_id == event.id
        participant = User.find(attendance.user_id)
        list_of_participants << participant
        puts "$"*60
        puts participant.first_name
      end
    end
    list_of_participants
  end

  private

  def send_participation_notification
    UserMailer.event_participation_email(self).deliver_now
  end
end
