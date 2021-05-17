class User < ApplicationRecord
  has_many :attendances
  has_many :event, through: :attendances
  has_many :administrated_events, foreign_key: "administrator_id", class_name: "Event"

  after_create :welcome_send

  private

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end
end
