class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  

    has_many :participations, dependent: :destroy
    has_many :attended_events, through: :participations, source: :event
  
    has_many :administrated_events, foreign_key: :administrator_id, class_name: "Event"

    validates_presence_of :email, :encrypted_password

    after_create :welcome_send

    def welcome_send
      UserMailer.welcome_email(self).deliver_now
    end
    

    
  end
  