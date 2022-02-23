class Event < ApplicationRecord
  ## PUBLIC SECTION ##

  # RELATIONS
  has_many :attendances, foreign_key: "event_id", dependent: :destroy
  has_many :attendees, class_name: "User", through: :attendances
  belongs_to :promoter, class_name: "User"

  # CALL-BACKS

  # VALIDATIONS
  # Start_date
  # Mandatory + Forbidden to create or update a past event
  #   QUESTION: is it useful to add "on: create / dupdate" here ? Is it possible to have both in 1 line only?
  #   NOTICE: Line below does not work on the v5.2.6 of Rails... Replaced by an ol'school call to a dedicated method
  #           validates :start_date, presence: true, comparison: { greater_than_or_equal_to: Date.today} 
  validates :start_date, presence: true, if: :start_date_cannot_be_in_the_past 

  # Duration
  # Mandatory + Must be a multiple of 5 + Must be strictly greater than 0
  validates :duration, presence: true, 
                       if: :div_by_5_and_pos?

  # Title
  # Mandatory + Must be between 5 and 140 characters long
  validates :title, presence: true, 
                    length: { minimum: 5, maximum: 140 }
  
  # Description
  # Mandatory + Must be between 5 and 140 characters long
  validates :description, presence: true, 
                          length: { minimum: 20, maximum: 2000 }

  # Price
  # Mandatory + Must be an Integer + Value must be between 1 and 1000
  validates :price, presence: true, 
                    numericality: { only_integer: true, 
                                    greater_than_or_equal_to: 1, 
                                    less_than_or_equal_to: 1000 }

  # Location
  # Mandatory
  validates :location, presence: true 

  ## PRIVATE SECTION ##
  private

  def start_date_cannot_be_in_the_past
    print "  > Testing 'start_date' is in the future"
    self.start_date >= Date.today
    puts "...OK!"
  end

  def div_by_5_and_pos?
    print "  > Testing duration is a multiple of 5 and greater than 0"
    ((self.duration%5 == 0) && (self.duration > 0))
    puts "...OK!"
  end

end
