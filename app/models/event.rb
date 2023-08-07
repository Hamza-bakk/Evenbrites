class Event < ActiveRecord::Base
    belongs_to :administrator, class_name: "User"
  
    has_many :participations, dependent: :destroy
    has_many :participants, through: :participations, source: :user
  
    validates :start_date, presence: true
    validates :duration, presence: true, numericality: { greater_than: 0, only_integer: true, divisible_by: 5 }
    validates :title, presence: true, length: { minimum: 5, maximum: 140 }
    validates :description, presence: true, length: { in: 20..1000 }
    validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 1000 }
    validates :location, presence: true
  
    validate :start_date_cannot_be_in_the_past
  
    def start_date_cannot_be_in_the_past
      errors.add(:start_date, "Elle ne peut pas être au passé") if start_date.present? && start_date < Time.zone.now
    end
  end
  