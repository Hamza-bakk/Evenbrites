class User < ActiveRecord::Base
    has_many :participations, dependent: :destroy
    has_many :attended_events, through: :participations, source: :event
  
    has_many :administrated_events, foreign_key: :administrator_id, class_name: "Event"
  end
  