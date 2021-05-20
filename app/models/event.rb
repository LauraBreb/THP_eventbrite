class Event < ApplicationRecord
  validates :start_date, presence: true, timeliness: {on_or_after: lambda { Date.current }}
  validates :duration, presence: true
  validate :duration_must_be_a_multiple_of_5
  validates :title, presence: true, length: {in: 5..140}
  validates :description, presence: true, length: {in: 20..1000}
  validates :price, presence: true, numericality:{greater_or_equal_to: 0, less_than: 1001}
  validates :location, presence: true

  has_many :attendances
  has_many :users, through: :attendances
  belongs_to :administrator, class_name: "User"

  def duration_must_be_a_multiple_of_5
    if duration.modulo(5)!= 0
      errors.add(:duration, "la durée doit être un multiple de 5 !")
    end
  end

  def current_user_not_registered(user)
    event_users_id =[]
    self.attendances.each do |attendance|
      event_users_id << attendance.user_id
    end
    if event_users_id.include? user.id
      return false
    else
      return true
    end
  end

  def is_free?
    if
      self.price == 0
      return true
    else
      return false
    end
  end

end
