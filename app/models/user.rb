class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :attendances
  has_many :events, through: :attendances
  has_many :administrated_events, foreign_key: "administrator_id", class_name: "Event"

  after_create :welcome_send

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end


  def find_user_events
    events = []
    Event.all.each do |event|
      if event.administrator_id == self.id
      events << event
      else
      end
    end
    return events
  end
end
