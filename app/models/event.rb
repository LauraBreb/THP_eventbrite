class Event < ApplicationRecord
  validates :start_date, presence: true, timeliness: {on_or_after: lambda { Date.current }}
  validates :duration, presence: true
  validate :duration_must_be_a_multiple_of_5
  validates :title, presence: true, length: {in: 5..140}
  validates :description, presence: true, length: {in: 20..1000}
  validates :price, presence: true, numericality:{greater_than: 0, less_than: 1001}
  validates :location, presence: true

  has_many :attendances
  has_many :users, through: :attendances
  belongs_to :administrator, class_name: "User"


  private

  def duration_must_be_a_multiple_of_5
    if duration.modulo(5)!= 0
      errors.add(:duration, "la durée doit être un multiple de 5 !")
    end
  end

end
