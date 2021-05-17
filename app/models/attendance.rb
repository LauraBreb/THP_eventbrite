class Attendance < ApplicationRecord
  belongs_to :user
  belongs_to :event

  after_create :send_participation_notification

  private

  def send_participation_notification
    UserMailer.event_participation_email(self).deliver_now
  end
end
