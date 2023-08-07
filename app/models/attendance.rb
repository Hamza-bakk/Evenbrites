class Attendance < ActiveRecord::Base
    belongs_to :user
    belongs_to :event
  
    validates :stripe_customer_id, presence: true, uniqueness: true
  end