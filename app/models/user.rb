class User < ApplicationRecord
  has_many :attendances
  has_many :event, through: :attendances
  has_many :administrated_events, foreign_key: "administrator_id", class_name: "Event"
end
