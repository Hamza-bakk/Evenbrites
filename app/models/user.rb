class User < ActiveRecord::Base
  after_create :welcome_send

    has_many :participations, dependent: :destroy
    has_many :attended_events, through: :participations, source: :event
  
    has_many :administrated_events, foreign_key: :administrator_id, class_name: "Event"

    def welcome_send
      UserMailer.welcome_email(self).deliver_now
    end
    
  end
  