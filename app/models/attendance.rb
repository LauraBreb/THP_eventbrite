class Attendance < ApplicationRecord
  belongs_to :user
  belongs_to :event

  after_create :validation_send

  private

  def send_validation
    UserMailer.event_validation_email(self).deliver_now
  end
end
